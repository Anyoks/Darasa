class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy, :download]
  before_action :authenticate_admin, only:[:new, :edit, :update, :create, :destroy, :download]
  # before_action :authenticate_user!


  
  #before_action 

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
    @semesters = Semester.all #II need to look into this.
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
     session[:return_to] ||= request.referer
     @back1_url =  session[:return_to]
      @topic = Topic.find(params[:id])
      @topic.subtopics.each do |subtopic|
        subtopic.questions.each do |question|
              @questions = subtopic.questions.order('created_at DESC').page(params[:page]).per_page(7)
          end
        end
  end

  # GET /topics/new
  def new
    @topic = Topic.new
    @semesters = Semester.all
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def download
    #{}"#{Rails.root}/uploads/topic/attachment/#{topic.id}/topic.name.pdf",
      @topic = Topic.find(params[:id])
      send_file(@topic.attachment.path,
                filename: "#{@topic.name}.pdf",
                type: "application/pdf")
    end

    def make_sample
      @topic = Topic.find(params[:topic_id])
      @topic.make_sample
      respond_to do |format|
        format.html { redirect_to @topic, notice:  " #{@topic.name} is now a Sample." }
        format.json { head :no_content }
      end
    end

    def undo_sample
      @topic = Topic.find(params[:topic_id])
      @topic.undo_sample
      respond_to do |format|
        format.html { redirect_to @topic, notice:  " #{@topic.name} is Not a Sample." }
        format.json { head :no_content }
      end
    end
      

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :code, :attachment, :unit_id)
    end
end
