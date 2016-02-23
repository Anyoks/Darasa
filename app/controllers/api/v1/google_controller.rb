class Api::V1::GoogleController < ApplicationController
	before_filter :authenticate_user!, except: [:google]
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	def google
	
		uid = params[:google][:uid]

	  	logged = User.find_by_uid( params[:user][:uid])

	  	if logged
	  		sign_in(:user, logged) #if there are sign them in!
			render json: { success: true, msg: "logged in", authentication_token: logged.authentication_token, user_id: logged.id }, status: :ok #return success!
		else

			user = User.new(user_params)
			# byebug
			user.password = Devise.friendly_token[0,20]
			user.provider = "google"
			if user.save
				return success user
			else
				warden.custom_failure!
				error = ""
				message = ""
				user.errors.messages.each do |k,v|
					error = v 
					message = k
				end
				err = error[0]
				itm = message.to_s
				msg = itm + ' ' + err
				render json: {success: false, error: msg }, status: :unprocessable_entity
			end
		end
	end

	private

		def success user
			render json: { success: true, user_id: user.id, authentication_token: user.authentication_token }, status: :created
		end

		def invalid_credentials
			render json: { success: false, error: "Error with your credentials"}, status: :unprocessable_entity
		end

		def user_params
			params.require(:user).permit(:first_name, :second_name, :email, :phone_number, :uid)
		end

end
