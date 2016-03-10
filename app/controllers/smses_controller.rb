class SmsesController < ApplicationController
  def index
  	@smses = Sms.order('created_at DESC').page(params[:page]).per_page(7)
    
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
