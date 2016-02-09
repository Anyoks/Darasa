class Api::V1::TopicsController < ApplicationController
	before_filter :authenticate_user!
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json


	  # GET api/v1/topics
	  # GET api/v1/topics.json
	def index

	    resource =  User.find_by_authentication_token(params[:auth_token])
	    # byebug
	    return invalid_user unless resource

	    #********If the use is an admin they can view everything************#
	    #****if not, they'll view what we have approved*********####

	    # if resource.is_admin?
	      @topics = Topic.all

	      # respond_with(@topics)
	    # else
	    #   @topics =  Topic.where("available = 'true'")
	    # end
	    # @semesters = Semester.all #II need to look into this.
	end
	  #***********end of admin privilage setting :-) *****#

	  # GET /topics/1
	  # GET /topics/1.json
	  def show
	     resource =  User.find_by_authentication_token(params[:auth_token])
	     return invalid_user unless resource

	     @topic = Topic.find(params[:id])
	 
	  end



	  private

	  def ensure_authentication_token_param_exists
	    ensure_param_exists :authentication_token
	  end

	  def invalid_user
	    render json: { success: false, message: "Error with your credentials"}, status: :unauthorized
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
end
