class Api::V1::PaymentsController < ApplicationController
	# before_filter :authenticate_user!
	before_filter :authenticate_user!, except: [:pay]


	def pay
		params.permit!
		# byebug
		user =  User.find_by_authentication_token(params[:auth_token]) # when Axel says it's hard to get the id, I'll pick the Auth_token and in the Payment model find the user before saving. :-)
		return invalid_details unless user

		# user_id = user.id
		
		topic = Topic.find_by_id(params[:payment][:topic_id])
		return invalid_topic unless topic

		topic_name = topic.name
	
		return invalid_topic unless topic

		###***somehwere here I have to check if the Mpesa code is in the Mpesa Payments table ***###

		@payment = Payment.new(payment_params)
		# byebug

		if @payment.save
			payment_successful topic_name
			return
		else
			invalid_payment_details
		end

	end

	def index
		@payments = Payment.all
	end


	def show
	end

	protected

	def invalid_details
	  render json: { success: false, error: "Error with your user details"}, status: :unauthorized
	end

	def invalid_payment_details
	  render json: { success: false, error: "Error with your payment details"}, status: :unauthorized
	end

	def invalid_topic
	  render json: { success: false, error: "couldn't find that topic"}, status: :unauthorized
	end

	def payment_successful topic_name

		render json: { success: true, msg: "The payment was successful, you now own #{topic_name}" }, status: :ok
		return
	end

	def payment_failed
		render json: { success: false, msg: "your payment failed please check the confirmation code and try again  " }, status: :unprocessable_entity
		# return
	end

	def payment_is_being_processed
		render json: { success: true, msg: "Order has been made"}, status: :ok
	end

	def payment_params
		# params.permit!
		# user =  User.find_by_authentication_token(params[:auth_token]).id
		# user_id = user.id
		params.require(:payment).permit(:topic_id,:mpesa_code, :user_id)
		# byebug
	end

	def order_params
		authentication_token = User.find(params[:payment][:user_id]).authentication_token
		order_url = $order_url
		params.permit(authentication_token,order_url)
	end
end