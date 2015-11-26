class Api::V1::SessionsController <  Api::V1::BaseController
	before_filter :authenticate_user!, except: [:create]
  before_filter :ensure_user_login_param_exists, only: [:create]
  after_filter :set_csrf_header, only: [:new, :create]
  # before_filter :ensure_email_param_exists, only: [:create]
  # before_filter :ensure_password_param_exists, only: [:create]
  respond_to :json

  def create
    resource = User.find_for_database_authentication(email: params[:user_login][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user_login][:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token
      render json: { success: true, authentication_token: resource.authentication_token }, status: :created
      return
    end
    invalid_login_attempt
  end

  def destroy
    resource =  User.find_by_authentication_token(params[:auth_token])
    return invalid_credentials unless resource

    resource.reset_authentication_token
    render json: { success: true }, status: :ok
  end



   def ensure_authentication_token
     if authentication_token.blank?
       self.authentication_token = generate_authentication_token
     end
  end


  protected

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  def set_csrf_header
     response.headers['X-CSRF-Token'] = form_authenticity_token
  end

 
  def ensure_user_login_param_exists
    ensure_param_exists :user_login
  end

  def ensure_email_param_exists
    ensure_param_exists :email
  end

  def ensure_password_param_exists
    ensure_param_exists :password
  end

  def ensure_param_exists(param)
    return unless params[param].blank?
    render json:{ success: false, message: "Missing #{param} parameter"}, status: :unprocessable_entity
  end

  def invalid_credentials
    render json: { success: false, message: "Error with your credentials"}, status: :unprocessable_entity
  end

  def invalid_login_attempt
    render json: { success: false, message: "Error with your login or password"}, status: :unauthorized
  end
end
