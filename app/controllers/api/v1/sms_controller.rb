class Api::V1::SmsController < ApplicationController


  def sms

  end

    before_action :set_sms, only: [:show, :edit, :update, :destroy]
    protect_from_forgery :except => :create 
  # before_action :authenticate_user

  # GET /smss
  # GET /smss.json
  def index
    @sms = Sms.all
  end

  # GET /smss/1
  # GET /smss/1.json
  def show
    @sms = Sms.all
  end

  # GET /smss/new
  def new
    @sms = Sms.new
  end

  # GET /smss/1/edit
  def edit
  end

  # POST /smss
  # POST /smss.json
  def create
    @sms = Sms.new(sms_params)

    respond_to do |format|
      if @sms.save
        # byebug
        format.html { redirect_to  api_v1_sm_url(@sms), notice: 'sms was successfully created.' }
        format.json { render :show, status: :created, location: @sms }
      else
        format.html { render :new }
        format.json { render json: @sms.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smss/1
  # PATCH/PUT /smss/1.json
  def update
    respond_to do |format|
      if @sms.update(sms_params)
        format.html { redirect_to @sms, notice: 'sms was successfully updated.' }
        format.json { render :show, status: :ok, location: @sms }
      else
        format.html { render :edit }
        format.json { render json: @sms.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smss/1
  # DELETE /smss/1.json
  def destroy
    @sms.destroy
    respond_to do |format|
      format.html { redirect_to sms_url, notice: 'sms was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sms
      @sms = Sms.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sms_params
      params.require(:sms).permit(:message, :phone)
    end
end

