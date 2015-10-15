class Api::TandemsController < ApplicationController


	def create

		#todo:

		grudge = params[:grudge]
		tandem = params[:tandem].permit(:invitee_email, :invitee_name, :invitee_id, :inviter_id, :purpose, :invitation_type, :invitee_email_subject, :invitee_email_text)

		r = false

		if tandem[:invitation_type] && (tandem[:invitee_id] == current_user.id || tandem[:inviter_id] == current_user.id) && current_user.tandems.count < 100

			tandem[:invitee_grudges_inviter_for] = grudge if tandem[:invitee_id] == current_user.id
			tandem[:inviter_grudges_invitee_for] = grudge if tandem[:inviter_id] == current_user.id

			tandem[:invitation_token] = loop do
			  token = SecureRandom.urlsafe_base64
			  break token unless Tandem.exists?(invitation_token: token)
			end

			#check if invited email address already exists in users and change to existing tandem
			if tandem[:invitation_type] == 'mail'
				partner = User.where(:email => tandem[:invitee_email]).first
				if partner
					tandem[:invitation_type] == 'existing'
					tandem[:invitee_id] == partner.id
				end
			end


			if tandem[:invitation_type] == 'link'
				tandem[:invitation_accepted_at] = Time.now
				tandem[:invitee_participates] = true
				#send mail to inviter and inform about confirmation
				if r = Tandem.create(tandem)
					InvitationMailer.inform_about_link_confirmation(tandem,current_user,User.find(tandem[:inviter_id])).deliver
				end
			else #existing, mail, random
				tandem[:invitation_accepted_at] = Time.now
				if tandem[:invitation_type] == 'existing'
					if r = Tandem.create(tandem)
						InvitationMailer.invite_existing(tandem,current_user,User.find(tandem[:invitee_id])).deliver
					end
				else
					r = Tandem.create(tandem)
				end
			end

		end

    	render json: {:tandem => r }

	end

	def update
			tandem = Tandem.find(params[:id])
			tandem[:invitee_grudges_inviter_for] = params[:grudge] if tandem[:invitee_id] == current_user.id
			tandem[:inviter_grudges_invitee_for] = params[:grudge] if tandem[:inviter_id] == current_user.id
			tandem.save
			#InvitationMailer.inform_mail_confirmation(tandem,current_user,User.find(tandem[:inviter_id])).deliver
			render json: {:success => true}
	end

	def destroy

		tandem = Tandem.find(params[:id])
		if tandem.inviter_id == current_user.id || tandem.invitee_id == current_user.id
			tandem.disabled_by = current_user.id
			tandem.save
			render json: {:success => true}
		end
	end

end
