class Api::V1::SubtopicsController < ApplicationController
	before_filter :authenticate_user! #, except: [:answer]
	before_filter :ensure_question_id_exists, only: [:answer]
	before_filter :ensure_token_exists
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	 # byebug
	# require 'json'
	
	# load_and_authorize_resource
	# GET /subtopics
	# GET /subtopics.json
	# byebug
	def index

	  @resource =  User.find_by_authentication_token(params[:auth_token])
	  # byebug
	  return invalid_user unless @resource
	  @subtopics = Subtopic.all
	  # @user = current_user
	end

	# GET /subtopics/1
	# GET /subtopics/1.json
	def show

	  @resource =  User.find_by_authentication_token(params[:auth_token])
	  return invalid_user unless @resource
	  @subtopic = Subtopic.find(params[:id])

	  return cannot_find_subtopic unless @subtopic
	    
	  # end
	end

	def answer
	  # byebug
	  @resource =  User.find_by_authentication_token(params[:auth_token])
	  return invalid_user unless @resource

	  @question = Question.find_by_id(params[:question_id])
	  return invalid_question unless @question
	 
	  if @question
	     @answer = @question.response.answer
	    if @answer
	      render json: { success: true, text: @answer }, status: :ok
	    else
	      render json: { success: false, error: "No answer for this question" }, status: :unprocessable_entity
	    end
	  else
	    render json: { success: false, error: "that question was not found" }, status: :unprocessable_entity
	  end
	end

	def all_questions_in_topic

		@resource =  User.find_by_authentication_token(params[:auth_token])
		return invalid_user unless @resource

		@topic = Topic.find(params[:topic_id]) #topic_id
		return invalid_topic unless @topic
		
	end

	# GET /subtopics/new
	
	private


	def ensure_param_exists(param)
	  return unless params[param].blank?
	  render json:{ success: false, error: "Missing #{param} parameter"}, status: :unprocessable_entity
	end

	def ensure_token_exists
	  ensure_param_exists :auth_token
	end

	def ensure_question_id_exists
	  ensure_param_exists :question_id
	end

	def ensure_authentication_token_param_exists
	  ensure_param_exists :authentication_token
	end

	def invalid_question
	  render json: { success: false, error: "Cannot find that question"}, status: :unauthorized
	end

	def invalid_topic
	  render json: { success: false, error: "Cannot find that topic"}, status: :unauthorized
	end

	def cannot_find_subtopic
	  render json: { success: false, error: "Cannot find that subtopic "}, status: :unauthorized
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
	  def set_subtopic
	    @subtopic = Subtopic.includes(:questions).find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def subtopic_params
	    params.require(:subtopic).permit(:title, :date, :unit_id, 
	      questions_attributes:[ :id, :question, :subtopic_id,  :_destroy,
	      response_attributes:[:id, :answer, :question_id, :video,:_destroy]]
	      )
	  end
end
