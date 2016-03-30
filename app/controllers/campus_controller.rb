class CampusController < ApplicationController
  before_action :set_campu, only: [:show, :edit, :update, :destroy]

  # GET /campus
  # GET /campus.json
  def index
    @campus = Campu.all
  end

  # GET /campus/1
  # GET /campus/1.json
  def show
  end

  # GET /campus/new
  def new
    @campu = Campu.new
  end

  # GET /campus/1/edit
  def edit
  end

  # POST /campus
  # POST /campus.json
  def create
    @campu = Campu.new(campu_params)

    respond_to do |format|
      if @campu.save
        format.html { redirect_to @campu, notice: 'Campu was successfully created.' }
        format.json { render :show, status: :created, location: @campu }
      else
        format.html { render :new }
        format.json { render json: @campu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campus/1
  # PATCH/PUT /campus/1.json
  def update
    respond_to do |format|
      if @campu.update(campu_params)
        format.html { redirect_to @campu, notice: 'Campu was successfully updated.' }
        format.json { render :show, status: :ok, location: @campu }
      else
        format.html { render :edit }
        format.json { render json: @campu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campus/1
  # DELETE /campus/1.json
  def destroy
    @campu.destroy
    respond_to do |format|
      format.html { redirect_to campus_url, notice: 'Campu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campu
      @campu = Campu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campu_params
      params.require(:campu).permit(:campus_name, :location, :institution_id)
    end
end
