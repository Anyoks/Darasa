class Api::V1::ExamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_question_id_exists, only: [:answer]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json
   # byebug
  # require 'json'
  
  # load_and_authorize_resource
  # GET /exams
  # GET /exams.json
  def index

    @resource =  User.find_by_authentication_token(params[:auth_token])
    # byebug
    return invalid_user unless @resource
    @exams = Exam.all
    # @user = current_user
  end

  # GET /exams/1
  # GET /exams/1.json
  def show

    @resource =  User.find_by_authentication_token(params[:auth_token])
    return invalid_user unless @resource
    @exam = Exam.find(params[:id])

    return cannot_find_exam unless @exam
      
    # end
  end

  def answer
    @resource =  User.find_by_authentication_token(params[:auth_token])
    return invalid_user unless @resource

    @answer = Question.find(params[:question_id]).response.answer

    if @answer
      render json: { success: true, text: @answer }, status: :ok
    else
      render json: { success: false, error: "No answer for this question" }, status: :ok
    end
  end

  # GET /exams/new
  
  private

  def ensure_param_exists(param)
    return unless params[param].blank?
    render json:{ success: false, error: "Missing #{param} parameter"}, status: :unprocessable_entity
  end

  def ensure_question_id_exists
    ensure_param_exists :question_id
  end

  def ensure_authentication_token_param_exists
    ensure_param_exists :authentication_token
  end

  def cannot_find_exam
    render json: { success: false, error: "Cannot find exam with that id"}, status: :unauthorized
  end

  def invalid_user
    render json: { success: false, error: "Error with your credentials"}, status: :unauthorized
  end

  def set_csrf_header
     response.headers['X-CSRF-Token'] = form_authenticity_token
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.includes(:topics).find(params[:id]) #include(:topics) includes all teh topics in that unit pre-emptively, saving alot ot memory and computing resources
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.includes(:questions).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:title, :date, :unit_id, 
        questions_attributes:[ :id, :question, :exam_id,  :_destroy,
        response_attributes:[:id, :answer, :question_id, :video,:_destroy]]
        )
    end
end

