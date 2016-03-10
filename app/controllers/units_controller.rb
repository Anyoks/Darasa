class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, only:[:new, :edit, :update, :create, :destroy]

  # GET /units
  # GET /units.json
  def index
    @units = Unit.order('created_at ASC').page(params[:page])
    # @semesters = Semester.all #II need to look into this.

  end

  # GET /units/1
  # GET /units/1.json
  def show
    @topics = @unit.topics
    @unit = Unit.find(params[:id])
    
     @unit.topics.each do |topic|
      topic.subtopics.each do |subtopic|
        subtopic.questions.each do |question|
              @questions = subtopic.questions.order('created_at ASC').page(params[:page])
            end
          end
        end

    # questions = Question.order('created_at ASC').page(params[:page])
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
   # @semesters = Semester.all #II need to look into this.
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(unit_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to units_url, notice: 'Unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url, notice: 'Unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.includes(:topics).find(params[:id]) #include(:topics) includes all teh topics in that unit pre-emptively, saving alot ot memory and computing resources
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:name, :semester_id,:price_id)
    end
end
