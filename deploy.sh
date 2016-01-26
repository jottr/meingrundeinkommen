# deploy.sh
#! /bin/bash

SHA1=$1
APP_NAME=meinbge-rails

# Deploy image to Docker Hub
echo "Pushing image to docker hub."
docker push meinbge/meinbge-rails:$SHA1

# Create new Elastic Beanstalk version
EB_BUCKET="${APP_NAME}"-bucket
DOCKERRUN_FILE=$SHA1-Dockerrun.aws.json

sed "s/<TAG>/$SHA1/" < Dockerrun.aws.json.template > $DOCKERRUN_FILE

# Copy the docker image to S3
aws s3 cp $DOCKERRUN_FILE s3://$EB_BUCKET/$DOCKERRUN_FILE

# Create application from docker image in S3 bucket
aws elasticbeanstalk create-application-version --application-name "${APP_NAME}" \
  --version-label $SHA1 --source-bundle S3Bucket=$EB_BUCKET,S3Key=$DOCKERRUN_FILE

# Update Elastic Beanstalk environment to new version
aws elasticbeanstalk update-environment --environment-name "${APP_NAME}"-env \
    --version-label $SHA1
