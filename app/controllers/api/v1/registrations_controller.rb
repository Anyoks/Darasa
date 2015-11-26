class Api::V1::RegistrationsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	def create

	  user = User.new(user_params)
	  # byebug
	  if user.save
	    # render json: user.authentication_token #as_json(auth_token: user.authentication_token), status: :created
	    render json: { success: true, authentication_token: user.authentication_token }, status: :created
	    return
	  else
	    warden.custom_failure!
	    # render json: { success: false, message: "Wrong Credentials"}, status: :failed
	    error = ""
	    message = ""
	    user.errors.messages.each do |k,v|
	    	error = v 
	    	message = k
	    end
	    err = error[0]
	    itm = message.to_s

	    msg = itm + ' ' + err
	    render json: {success: false, message: msg, status: :unprocessable_entity}
	  end
	end

	 def user_params
      params.require(:user).permit(:first_name, :second_name, :email, :password, :provider)
    end
end