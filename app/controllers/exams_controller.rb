class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  require 'json'
  
  # load_and_authorize_resource
  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all
    # @user = current_user
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @exam = Exam.find(params[:id])
    @current_user = current_user
  end

  # GET /exams/new
  def new

    @exam = Exam.new
      1.times do
        @exam.questions.build.build_response
      end
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept_tos
    # @exam = Exam.find(params[:id])
    
     @user = User.find(current_user.id)

     @user.agree_tos #(terms_params)
    # redirect_to new_exam_path
    # puts "hahaha"
   redirect_to new_exam_path, notice: 'You have accepted The terms of Service.'
  end

   def download
    #{}"#{Rails.root}/uploads/topic/attachment/#{topic.id}/topic.name.pdf",
      @exam = Exam.find(params[:id])
      send_file(@exam.attachment.path,
                filename: "#{@topic.title}.pdf",
                type: "application/pdf")
    end

    # def as_json(options={})
    #   super(:only => [:questions]
    #   )
    # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.includes(:questions).find(params[:id])
    end


    def terms_params
      params.permit(:id, :terms)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:title, :attachment, :date, :unit_id, 
        questions_attributes:[ :id, :question, :exam_id,  :_destroy,
        response_attributes:[:id, :answer, :question_id, :_destroy]]
        # responses:[:id, :response, :question_id, :_destroy]]
        )
    end
end

