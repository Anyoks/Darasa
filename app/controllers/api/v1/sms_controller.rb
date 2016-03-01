class Api::V1::SmsController < ApplicationController

  before_filter :authenticate_user! , except: [:sms, :show,:index]
  before_filter :ensure_message_exists, only: [:sms]
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json


  def sms
    @sms = Sms.new(sms_params)
# byebug
    if @sms.extract(params[:message])
      return message_recieved# render "api/v1/sms/success.json"# return message_recieved 
    else
      return message_not_recieved 
    end
  end




  private


  def message_recieved 
    render "api/v1/sms/success.json"
  end

  def message_not_recieved
     render "api/v1/sms/fail.json"
  end

  def ensure_message_exists
    ensure_param_exists :message
  end

  def ensure_param_exists(param)
    return unless params[param].blank?
    render"api/v1/sms/fail.json"
    # render json:{ success: false, error: "Missing #{param} parameter"}, status: :unprocessable_entity
  end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def sms_params
      params.permit(:message)
    end
end

