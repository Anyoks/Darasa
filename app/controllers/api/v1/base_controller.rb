class Api::V1::BaseController <  ApplicationController
	before_filter :authenticate_user!
	  prepend_before_filter :get_auth_token

	  respond_to :xml, :json

	  private
	  def get_auth_token
	    if authentication_token = params[:authentication_token].blank? && request.headers["X-AUTH-TOKEN"]
	      params[:authentication_token] = authentication_token
	    end
	  end
end
