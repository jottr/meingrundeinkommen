class Api::MailingsController < ApplicationController
  # require 'mailers/massmailer'

  def create
    if current_user.admin?

      if params[:groups]
        users = MailingsMailer.prepare_recipients(params[:groups],params[:group_keys])
    end

      if params[:send]
        if params[:test]
          # send it
          render json: MailingsMailer.transactionmail([User.find(current_user.id)],params[:subject],params[:body]).deliver
        else
          # write to queue

          queue = {
            groups:     params[:groups],
            group_keys: params[:group_keys],
            subject:    params[:subject],
            body:       params[:body]
          }

          File.open('tmp/mailqueue.json', 'w+') do |f|
            f.write(queue.to_json)
          end

          render json: true
        end
      else
        render json: { count: users ? users.count : 0, groups: MailingsMailer.possible_user_groups }
      end
  end
  end
end
