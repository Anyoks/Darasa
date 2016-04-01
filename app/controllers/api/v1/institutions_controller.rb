class Api::V1::InstitutionsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

	before_filter :authenticate_user!, except: [:index]
	# byebug
	before_filter :ensure_authentication_token_param_exists, :ensure_type_param_exists

	def index
		resource =  User.find_by_authentication_token(params[:auth_token])
		# byebug
		# byebug
		return invalid_user unless resource

		#********If the use is an admin they can view everything************#
		#****if not, they'll view what we have approved*********####

		if resource.is_admin?
		# if current_user.is_admin?
		  @institutions = Institution.where(:type_id => params[:type_id])
		  return no_institutions if @institutions.empty?
		else
		  @institutions =  Institution.where(:type_id => params[:type_id])
		   return no_institutions if @institutions.empty?
		end
		
	end



	private

	def ensure_authentication_token_param_exists
	  ensure_param_exists :auth_token
	end

	def ensure_type_param_exists
	  ensure_param_exists :type_id
	end

	def no_institutions
		render json: { success: false, msg: "No institutions!"}, status: :unprocessable_entity
	end

	def invalid_user
	  render json: { success: false, error: "Error with your credentials"}, status: :unauthorized
	end

	def set_csrf_header
	   response.headers['X-CSRF-Token'] = form_authenticity_token
	end

	  # Use callbacks to share common setup or constraints between actions.
	  # def set_institution
	  #   @institution = Institution.includes(:topics).find(params[:id]) #include(:topics) includes all teh topics in that institution pre-emptively, saving alot ot memory and computing resources
	  # end

	  def ensure_param_exists(param)
	    return unless params[param].blank?
	    render json:{ success: false, error: "Missing #{param} parameter"}, status: :unprocessable_entity
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def institution_params
	    params.require(:institution).permit(:name, :semester_id)
	  end
end
