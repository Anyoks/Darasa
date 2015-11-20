class Api::V1::RegistrationsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	def create

	  user = User.new(user_params)
	  # byebug
	  if user.save
	    render json: user.as_json(auth_token: user.authentication_token), status: :created
	    return
	  else
	    warden.custom_failure!
	    render json: user.errors, status: :unprocessable_entity
	  end
	end

	 def user_params
      params.require(:user).permit(:first_name, :second_name, :email, :password, :password_confirmation, :provider)
    end
end