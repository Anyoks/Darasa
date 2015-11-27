class Api::V1::UnitsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  # GET api/v1/units
  # GET api/v1/units.json
  def index

    resource =  User.find_by_authentication_token(params[:auth_token])
    # byebug
    return invalid_user unless resource

    @units = Unit.all
    # @semesters = Semester.all #II need to look into this.
  end

  # GET /units/1
  # GET /units/1.json
  def show
     resource =  User.find_by_authentication_token(params[:auth_token])
     return invalid_user unless resource

     @unit = Unit.find(params[:id])
    # byebug
    
    # @topics = @unit.topics
  end

  # GET /units/new
  # def new
  #   @unit = Unit.new
  # end

  # # GET /units/1/edit
  # def edit
  #  # @semesters = Semester.all #II need to look into this.
  # end

  # # POST /units
  # # POST /units.json
  # def create
  #   @unit = Unit.new(unit_params)

  #   respond_to do |format|
  #     if @unit.save
  #       format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
  #       format.json { render :show, status: :created, location: @unit }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @unit.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /units/1
  # # PATCH/PUT /units/1.json
  # def update
  #   respond_to do |format|
  #     if @unit.update(unit_params)
  #       format.html { redirect_to units_url, notice: 'Unit was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @unit }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @unit.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /units/1
  # # DELETE /units/1.json
  # def destroy
  #   @unit.destroy
  #   respond_to do |format|
  #     format.html { redirect_to units_url, notice: 'Unit was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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
      @unit = Unit.includes(:topics).find(params[:id]) #include(:topics) includes all teh topics in that unit pre-emptively, saving alot ot memory and computing resources
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:name, :semester_id)
    end
end
