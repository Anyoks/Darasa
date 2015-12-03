class Api::V1::DetailsController < ApplicationController
	# before_filter :authenticate_user!
	# after_filter :set_csrf_header
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	before_filter :ensure_unit_id_exists, only: [:show_unit]


	def show

		resource =  User.find_by_authentication_token(params[:auth_token])
		# byebug
		return invalid_user unless resource
		
		if resource.valid_for_authentication?  
			if resource.payments.empty?
				units_owned = []
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

	def show_unit
		# ensure_unit_id_exists :unit_id

		resource =  User.find_by_authentication_token(params[:auth_token])

		return invalid_user unless resource

		unit = Unit.find(params[:unit_id])

		# return ensure_param_exists unless unit 

		if unit 
			unit_name = unit.name
			render json: { success: true, text: unit_name }, status: :ok
		else
			invalid_unit
		end

	end

	protected

	def ensure_authentication_token_param_exists
	  ensure_param_exists :authentication_token
	end

	def ensure_param_exists(param)
	  return unless params[param].blank?
	  render json:{ success: false, error: "Missing #{param} parameter"}, status: :unprocessable_entity
	end

	def ensure_unit_id_exists
		ensure_param_exists :unit_id
	end

	# def ensure_param_exists(param)
	#   return unless params[param].blank?
	#   render json:{ success: false, message: "Missing #{param} parameter"}, status: :unprocessable_entity
	# end

	def invalid_user
		render json: { success: false, message: "Error with your credentials"}, status: :unauthorized
	end

	def invalid_unit
		render json: { success: false, error: "Error could not find unit name"}, status: :unauthorized
	end



	def set_csrf_header
	   response.headers['X-CSRF-Token'] = form_authenticity_token
	end


end
