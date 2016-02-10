class Api::V1::SmsController < ApplicationController

  before_filter :authenticate_user! , except: [:sms, :show,:index]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json


  def sms
    @sms = Sms.new(sms_params)
# byebug
    if @sms.extract(params[:message])
      return message_recieved 
    else
      return message_not_recieved 
    end
  end


  # end
  # # GET /smss
  # # GET /smss.json
  # def index
  #   @sms = Sms.all
  # end

  # # GET /smss/1
  # # GET /smss/1.json
  # def show
  #   @sms = Sms.all
  # end

  # # GET /smss/new
  # def new
  #   @sms = Sms.new
  # end

  # # GET /smss/1/edit
  # def edit
  # end

  # # POST /smss
  # # POST /smss.json
  # def create
  #   @sms = Sms.new(sms_params)

  #   respond_to do |format|
  #     if @sms.save
  #       # byebug
  #       format.html { redirect_to  api_v1_sms_url(@sms), notice: 'sms was successfully created.' }
  #       format.json { render :show, status: :created, location: @sms }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @sms.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /smss/1
  # # PATCH/PUT /smss/1.json
  # def update
  #   respond_to do |format|
  #     if @sms.update(sms_params)
  #       format.html { redirect_to @sms, notice: 'sms was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @sms }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @sms.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /smss/1
  # # DELETE /smss/1.json
  # def destroy
  #   @sms.destroy
  #   respond_to do |format|
  #     format.html { redirect_to sms_url, notice: 'sms was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

  def message_recieved 
    render json: { success: true, msg: "message recieved"}, status: :ok
  end

  def message_not_recieved
    render json: { success: false, error: "message reception failed"}, status: :unauthorized
  end
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_sms
  #     @sms = Sms.find(params[:id])
  #   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sms_params
      params.permit(:message)
    end
end

