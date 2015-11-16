class ResponsesController < ApplicationController
  before_action :set_Response, only: [:show, :edit, :update, :destroy]

  # GET /Responses
  # GET /Responses.json
  def index
    @responses = Response.all
  end

  # GET /Responses/1
  # GET /Responses/1.json
  def show
  end

  # GET /Responses/new
  def new
    @response = Response.new
  end

  # GET /Responses/1/edit
  def edit
  end

  # POST /Responses
  # POST /Responses.json
  def create
    @response = Response.new(Response_params)

    respond_to do |format|
      if response.save
        format.html { redirect_to response, notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: response }
      else
        format.html { render :new }
        format.json { render json: response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Responses/1
  # PATCH/PUT /Responses/1.json
  def update
    respond_to do |format|
      if response.update(Response_params)
        format.html { redirect_to response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: response }
      else
        format.html { render :edit }
        format.json { render json: response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Responses/1
  # DELETE /Responses/1.json
  def destroy
    response.destroy
    respond_to do |format|
      format.html { redirect_to Responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:Response).permit(:Response)
    end
end
