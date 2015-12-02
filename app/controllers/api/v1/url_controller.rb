class Api::V1::UrlController < ApplicationController
	before_filter :authenticate_user! , except: [:show]
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def show

		resource =  User.find_by_authentication_token(params[:auth_token]) #_id(params[:user_id]) #
		return invalid_user unless resource
		
		# if 
		url = []
		status = []
		url.clear

		if url.empty?
			if resource.payments.empty?
				return no_payments
			else

				resource.payments.each do |order|
					url << order.order_url unless order.order_url.nil? && order.status.nil?
					# url  << order.status
				end
			end
		else
			url.clear
			resource.payments.each do |order|
				url << order.order_url unless order.order_url.nil? && order.status.nil?
				# url  << order.status
			end
		end

		# byebug
		render json: { success: true, text: url }, status: :ok

		return

	end

	protected


	def invalid_user
	  render json: { success: false, error: "Error with your credentials"}, status: :unauthorized
	end

	def no_payments
		render json: { success: true, msg: "no payments"}, status: :ok
	end
end