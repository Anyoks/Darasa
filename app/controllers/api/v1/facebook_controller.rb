class  Api::V1::FacebookController < ApplicationController # Devise::OmniauthCallbacksController   
	# use OmniAuth::Strategies::FacebookAccessToken # ApplicationController # 
	before_filter :authenticate_user!, except: [:facebook]
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def facebook
		FbGraph2.debug!
		token = params[:facebook][:access_token]
		# byebug
		user = FbGraph2::User.me(token)
		# byebug
		user = user.fetch
		# byebug

		logged = User.find_by_uid(user.identifier)

			if logged #check i user is in the database
				sign_in(:user, logged) #if there are sign them in!
				# p "in the if statement"
				render json: { success: true, authentication_token: logged.authentication_token }, status: :ok #return success!

			else #if they are not in the DB create them!
				user1 = User.create(first_name:user.first_name,
								second_name:user.last_name,
								provider: "facebook",
								uid: user.identifier,
								email: params[:facebook][:email],
								password:Devise.friendly_token[0,20]
								)
				# byebug
				token = user1.authentication_token
				# puts "code is now here"
# byebug
				if token
					render json: { success: true, authentication_token: token, status: "created" }, status: :ok
				else
					token1 = User.find_by_email(params[:facebook][:email]).authentication_token
					render json: { success: true, authentication_token:token1, status: "created" }, status: :ok
				end
				
			end
	end
end