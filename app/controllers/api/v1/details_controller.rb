class Api::V1::DetailsController < ApplicationController
	# before_filter :authenticate_user!
	# after_filter :set_csrf_header
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json


	def show

		resource =  User.find_by_authentication_token(params[:auth_token])
		# byebug
		return invalid_user unless resource
		
		if resource.valid_for_authentication?  
			if resource.payments.empty?
				units_owned = "none"
			else
				units_owned = []
				resource.payments.each do | owned|
					units_owned << owned.unit_id
				end
			end

			render json: { success: true, user_id: resource.id, first_name: resource.first_name,
			second_name: resource.second_name, email: resource.email, units_owned: units_owned }, status: :ok
			return
		end
		invalid_user
	end

	protected

	def ensure_authentication_token_param_exists
	  ensure_param_exists :authentication_token
	end

	# def ensure_param_exists(param)
	#   return unless params[param].blank?
	#   render json:{ success: false, message: "Missing #{param} parameter"}, status: :unprocessable_entity
	# end

	def invalid_user
		render json: { success: false, message: "Error with your credentials"}, status: :unauthorized
	end

	def set_csrf_header
	   response.headers['X-CSRF-Token'] = form_authenticity_token
	end


end
