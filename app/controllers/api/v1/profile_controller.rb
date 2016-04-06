class Api::V1::ProfileController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	before_filter :authenticate_user!
	before_filter :ensure_authentication_token_param_exists #, :ensure_level_param_exists, :ensure_campus_id_param_exists, :ensure_course_id_param_exists,
	#:ensure_institution_id_param_exists, :ensure_user_id_param_exists, :ensure_auth_token_param_exists

  def index
  	resource =  User.find_by_authentication_token(params[:auth_token])
  	# byebug
  	return invalid_user unless resource

  	profile = Profile.new(profile_params)
  	return error unless profile.save

  	return update_success

  end



  private
  def update_success
  	render json: { success: true, msg: "Update success!"}, status: :ok
  end

  def invalid_user
    render json: { success: false, error: "Error with your credentials"}, status: :unauthorized
  end

  def error
  	render json: { success: false, error: "Error updating user profile"}, status: :unauthorized
  end

  def ensure_auth_token_param_exists
  	ensure_param_exists :auth_token
  end

  def ensure_user_id_param_exists
  	ensure_param_exists :user_id
  end

  def ensure_institution_id_param_exists
  	ensure_param_exists :institution_id
  end

  def ensure_course_id_param_exists
  	ensure_param_exists :course_id
  end

  def ensure_campus_id_param_exists
  	ensure_param_exists :campu_id
  end

  def ensure_level_param_exists
  	ensure_param_exists :level
  end
  def ensure_authentication_token_param_exists
    ensure_param_exists :auth_token
  end

  def profile_params
  	# params.require(:unit).permit(:name, :semester_id)
  	params.permit(:user_id, :institution_id, :course_id, :campu_id, :level)
  end



  def ensure_param_exists(param)
    return unless params[param].blank?
    render json:{ success: false, error: "Missing #{param} parameter"}, status: :unprocessable_entity
  end
end
