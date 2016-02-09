class Api::V1::TopicsController < ApplicationController
	 before_filter :authenticate_user! #, except: [:answer]
	# before_filter :ensure_question_id_exists, only: [:answer]
	# before_filter :ensure_token_exists
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json
	


	  # GET api/v1/topics
	  # GET api/v1/topics.json
	def index

	    resource =  User.find_by_authentication_token(params[:auth_token])
	    # byebug
	    return invalid_user unless resource

	     @topics = Topic.where(:unit_id => params[:unit_id])
	     return invalid_unit unless  @topics.count>0
	end
	  #***********end of admin privilage setting :-) *****#

	  # GET /topics/1
	  # GET /topics/1.json
	  def show
	     resource =  User.find_by_authentication_token(params[:auth_token])
	     return invalid_user unless resource

	     #if the user has this topic in their purchases, then can they view the questions,
	     

	     @topic = Topic.find(params[:topic_id])
	     return invalid_topic unless @topic
	     	
	     # end
	 
	  end



	  private

	  def ensure_authentication_token_param_exists
	    ensure_param_exists :authentication_token
	  end

	  def invalid_user
	    render json: { success: false, msg: "Error with your credentials"}, status: :unauthorized
	  end

	  def invalid_topic
	    render json: { success: false, msg: "Error couldn't find that topic"}, status: :unauthorized
	  end

	  def invalid_unit
	    render json: { success: false, msg: "Error couldn't find that unit"}, status: :unauthorized
	  end


	  def no_topics
	    render json: { success: false, msg: "Error no topics for this unit"}, status: :unauthorized
	  end

	  def set_csrf_header
	     response.headers['X-CSRF-Token'] = form_authenticity_token
	  end

	    # Use callbacks to share common setup or constraints between actions.
	    def set_unit
	      @unit = Topic.includes(:topics).find(params[:id]) #include(:topics) includes all teh topics in that unit pre-emptively, saving alot ot memory and computing resources
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def unit_params
	      params.require(:unit).permit(:name, :semester_id)
	    end


	    def set_default_response_format
	      request.format = :json
	    end
end
