class Api::V1::CoursesController < ApplicationController

		skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
		before_filter :authenticate_user!
		before_filter :ensure_authentication_token_param_exists
		before_filter :ensure_institution_id_param_exists


	  def index
	  	resource =  User.find_by_authentication_token(params[:auth_token])
	  	# byebug
	  	return invalid_user unless resource

	  	#********If the use is an admin they can view everything************#
	  	#****if not, they'll view what we have approved*********####
	  	@institution = Institution.where(:id =>params[:institution_id]).first
	  	return invalid_institution unless  @institution.present?

	  	if resource.is_admin?
	  	  @courses = Course.where(:institution_id => params[:institution_id])
	  	  return no_courses if @courses.empty?
	  	else
	  	  @courses =  Course.where(:institution_id => params[:institution_id])
	  	  return no_courses if @courses.empty?
	  	end

	  end



	  private

	  def no_courses
	  	render json: { success: false, msg: "No courses for this institution"}, status: :unprocessable_entity
	  end

	  def ensure_institution_id_param_exists
	  	ensure_param_exists :institution_id
	  end

	  def ensure_authentication_token_param_exists
	    ensure_param_exists :auth_token
	  end

	  def invalid_user
	    render json: { success: false, error: "Error with your credentials"}, status: :unauthorized
	  end

	  def invalid_institution
	    render json: { success: false, error: "Error couldn't find that institution"}, status: :unauthorized
	  end

	  def set_csrf_header
	     response.headers['X-CSRF-Token'] = form_authenticity_token
	  end

	    # Use callbacks to share common setup or constraints between actions.
	    # def set_institution
	    #   @institution = Course.includes(:topics).find(params[:id]) #include(:topics) includes all teh topics in that institution pre-emptively, saving alot ot memory and computing resources
	    # end

	    def ensure_param_exists(param)
	      return unless params[param].blank?
	      render json:{ success: false, error: "Missing #{param} parameter"}, status: :unprocessable_entity
	    end
end
