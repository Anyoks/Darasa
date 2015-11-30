class Api::V1::UrlController < ApplicationController
	before_filter :authenticate_user! , except: [:show]
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def show

		resource =  User.find(params[:user_id]) #_by_authentication_token(params[:auth_token])
		return invalid_user unless resource
		
		# if 
		url = []
		status = []
		url.clear

		if url.empty?
			resource.payments.each do |order|
				url << order.order_url unless order.order_url.nil? && order.status.nil?
				url  << order.status
			end
		else
			url.clear
			resource.payments.each do |order|
				url << order.order_url unless order.order_url.nil? && order.status.nil?
				url  << order.status
			end
		end

		# byebug
		render json: { success: true, text: url}, status: :ok

		return

	end

	protected


	def invalid_user
	  render json: { success: false, message: "Error with your credentials"}, status: :unauthorized
	end
end