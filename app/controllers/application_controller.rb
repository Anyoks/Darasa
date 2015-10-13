class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_units, :find_semesters, :find_years, :find_courses, :find_universities #every singel action in this app will run this code
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user, only: [:show ]



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

  def authenticate_admin
    authenticate_user!
    if current_user
      unless current_user.admin?
        redirect_to root_path, alert: "You are not authorised to perform that Operation"
      end
    end
  end

  def find_cats
    @cat = Cat.all
  end

  def find_exam
    @exam = Exam.all
  end
  
  def authenticate_user
    authenticate_user!
    unless current_user
      redirect_to new_user_session_path 
    end

  end

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :second_name, :email, :password, :phone_number) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :second_name, :email, :password, :phone_number) }
    end
end
