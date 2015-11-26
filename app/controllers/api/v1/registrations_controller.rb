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

	# def update
	#   resource =  User.find_by_authentication_token(params[:auth_token])

	#   return invalid_user unless resource
	  
	#   if resource.valid_for_authentication?  
	#   	resource.

	# end

	 def user_params
      params.require(:user).permit(:first_name, :second_name, :email, :password, :provider)
    end
end