class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user_from_token!
  protect_from_forgery with: :exception
  before_action :find_units, :find_semesters, :find_years, :find_courses, :find_universities #every singel action in this app will run this code
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user, only: [:show ]
  protect_from_forgery with: :null_session,
     if: Proc.new { |c| c.request.format =~ %r{application/json} }


  def find_units
  	@units = Unit.all
  end

  def find_semesters
  	@semesters = Semester.all
  end

  def find_years
    @years = Year.all
  end

  def find_courses
    @courses = Course.all
  end

  def find_universities
    @universities = University.all
  end

  def find_cats
    @cats = Cat.all
  end

  def find_exams
    @exams = Exam.all
  end

  # def accept_tos
  #   user = current_user
  #   User.find(user.id).update_attributes( :terms => true)
  # end

  def authenticate_admin
    if authenticate_user!
      if current_user
        unless current_user.admin?
          redirect_to root_path, alert: "You are not authorised to perform that Operation"
        end
      end
    else
      redirect_to new_user_session_path, alert: "You need to be signed !"
    end

  end

  def find_cats
    @cat = Cat.all
  end

  def find_exam
    @exam = Exam.all
  end
  
  def authenticate_user
    if authenticate_user!
      unless current_user
        redirect_to new_user_session_path , alert: "You are not authorised to perform that Operation"
      end
    else
      redirect_to new_user_session_path, alert: "You need to be signed !"
    end
  end

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :second_name, :email, :password, :phone_number) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :second_name, :email, :password, :phone_number) }
    end

  private

    def authenticate_user_from_token!
        user_email = params[:email].presence
        user       = user_email && User.find_by_email(user_email)

        # Notice how we use Devise.secure_compare to compare the token
        # in the database with the token given in the params, mitigating
        # timing attacks.
        if user && Devise.secure_compare(user.authentication_token, params[:user_token])
          sign_in :user, @user  # sign_in(scope, resource)
        end
      end


end
