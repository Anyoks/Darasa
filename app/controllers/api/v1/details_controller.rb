class Api::V1::DetailsController < ApplicationController
	before_filter :authenticate_user!, except: [:do_i_own_this_topic, :show]
	# after_filter :set_csrf_header
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	before_filter :ensure_unit_id_exists, only: [:show_unit]
	before_filter :ensure_topic_id_exists, only: [:do_i_own_this_topic]
	before_filter :ensure_user_id_exists, only: [:do_i_own_this_topic]


	def show_user_details

		@resource =  User.find_by_authentication_token(params[:auth_token])
		# byebug
		return invalid_user unless @resource
	end

	def do_i_own_this_topic
		resource = User.find_by_authentication_token(params[:auth_token])
		return invalid_user unless resource
		
		if resource.valid_for_authentication?
			if resource.owns? params[:topic_id]
				return i_own_this_topic
			else
				return dont_own_this_unit
			end
		else
			invalid_user
		end

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
			return invalid_unit
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

	def i_own_this_topic
		render json:{ success: true}, status: :ok
	end

	def dont_own_this_unit
	  render json:{ success: false }, status: :ok
	end

	def ensure_unit_id_exists
		ensure_param_exists :unit_id
	end

	def ensure_topic_id_exists
		ensure_param_exists :topic_id
	end

	def ensure_user_id_exists
		ensure_param_exists :user_id
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
