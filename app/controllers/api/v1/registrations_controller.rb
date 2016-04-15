class Api::V1::RegistrationsController < ApplicationController
	before_filter :authenticate_user!, except: [:create, :google]
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	def create

	  resource = User.new(user_params)
	  # byebug
	  if resource.save
	    # render json: resource.authentication_token #as_json(auth_token: resource.authentication_token), status: :created
	    intercom.users.create(:user_id => "#{resource.id}",
			:email => "#{resource.email}", 
			:name => "#{resource.first_name} #{resource.second_name}",
			:signed_up_at => "#{resource.created_at.to_i}",
			:last_seen_ip => "#{resource.current_sign_in_ip}",
			:custom_attributes => {
				:paid_subscriber => resource.payments.nil?
			}
		)

	    render json: { success: true, authentication_token: resource.authentication_token }, status: :created
	    
	    return
	  else
	    warden.custom_failure!
	    error = ""
	    message = ""
	    resource.errors.messages.each do |k,v|
	    	error = v 
	    	message = k
	    end
	    err = error[0]
	    itm = message.to_s
	    msg = itm + ' ' + err
	    render json: {success: false, error: msg }, status: :unprocessable_entity
	  end
	end


	def update
		params.permit!

		resource =  User.find_by_authentication_token(params[:auth_token])

		return invalid_credentials unless resource

		update_params = {}

		user_params.each do |k,v|
			unless v.blank? || k == "auth_token"
				update_params [k] = v
			end
		end

		if resource.update(update_params) #resource.valid_for_authentication?  
			intercom.users.create(:user_id => "#{resource.id}",
				:email => "#{resource.email}", 
				:name => "#{resource.first_name} #{resource.second_name}",
				:signed_up_at => "#{resource.signed_up_at.to_i}",
				:last_seen_ip => "#{resource.current_sign_in_ip}",
				:custom_attributes => {
					:paid_subscriber => resource.payments.nil?
				}
			)

			render json: { success: true }, status: :ok
		else
			invalid_credentials
		end
	end
	
private

	def invalid_credentials
	  render json: { success: false, error: "Error with your credentials"}, status: :unprocessable_entity
	end

	 def user_params
      params.require(:user).permit(:first_name, :second_name, :email, :phone_number, :password, :provider, :authentication_token)
    end
end