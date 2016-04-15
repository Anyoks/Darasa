class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user_from_token!
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :find_units, :find_semesters, :find_years, :find_courses, :find_institutions, :find_topics, :find_exams, :find_questions #every singel action in this app will run this code
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user! #, only: [:show ]
  before_action :authenticate_user!
  before_action :intercom
  protect_from_forgery with: :null_session,
     if: Proc.new { |c| c.request.format =~ %r{application/json} }
# byebug

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

  def find_institutions
    @institutions = Institution.all
  end

  def find_cats
    @cats = Cat.all
  end

  def find_exams
    @exams = Exam.all
  end
  def find_topics
    @topics = Topic.all
  end

  def find_questions
    @question = Question.all
  end

  # def accept_tos
  #   user = current_user
  #   User.find(user.id).update_attributes( :terms => true)
  # end

  
  def authenticate_admin
    if authenticate_user!
      # if current_user
        unless current_user
          redirect_to root_path, alert: "You are not authorised to perform that Operation"
        # end
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
  
  # def authenticate_user
  #    if authenticate_user!
  #      unless current_user
  #       # byebug
  #       redirect_to new_user_session_path , notice: "You need to be signed"
  #     end
  #     else
  #       redirect_to new_user_session_path , notice: "You need to be signed"
      
  #   end
  #   # # if current_user.is_admin?
  #   # #   alert: "You are not authorised to perform that Operation !"
  #   # # end
  #   "haha"
  # end

  def intercom
     intercom = Intercom::Client.new(app_id: 'ahd0euu5', api_key: 'b505f64477d12b3375524315399786d54e28f9b7')
  end

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :second_name, :email, :password, :phone_number) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :second_name, :email, :password, :phone_number) }
    end

  private

  def after_sign_in_path_for(resource)
    if current_user.is_moderator? || current_user.is_admin?
      session["user_return_to"] || exams_path #{}"/exams/index"#, :contorller => "exams_controller" #_path #redirect_to  exams_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    #byebug
        root_path #request.referrer #root_url#new_user_session #signed_in_root_path(resource)#new_user_session_path
  end


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
