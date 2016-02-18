class SmsesController < ApplicationController
  def index
  	@smses = Sms.all.order(created_at: :desc)
  end

  def show
  	@sms = Sms.find(params[:id])
  end

   def destroy
    @sms.destroy
    respond_to do |format|
      format.html { redirect_to smses_url, notice: 'sms was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
