class Api::V1::PaymentsController < ApplicationController
	# before_filter :authenticate_user!
	before_filter :authenticate_user!, except: [:pay]


	def pay
		# params.permit!
		# byebug
		user =  User.find_by_authentication_token(params[:auth_token]) # when Axel says it's hard to get the id, I'll pick the Auth_token and in the Payment model find the user before saving. :-)
		return invalid_details unless user
		
		#also check that the user_id is valid
		return invalid_details unless user.id == params[:payment][:user_id]

		topic = Topic.find_by_id(params[:payment][:topic_id])
		return invalid_topic unless topic

		topic_name = topic.name
	
		return invalid_topic unless topic


		@payment = Payment.new(payment_params)

		@payment.mpesa_code.upcase! # Just incase the user enters the code in small letters
		# byebug
		###***somehwere here I have to check if the Mpesa code is in the Sms table ***###
		###***I think it should be here ***###

		#basicallically all i want to do is check does this @payment.mpesa_code exist in the Sms table? if yes, 
		#user has paid, if not, that's a fake mpesa code.
		cash = mpesa_payment_text_exists @payment.mpesa_code
		# byebug
		if cash.present?
			if cash.amount.to_i >= 50 #i'll have to change this to seperate the large payments from the smaller ones
			#check if it has been used i.e it is in the payments
				if @payment.save
					unless user.has_admin_previlages?
						log_payment_activity user, topic_name, "#{user.first_name} successfully purchased this topic, #{topic.name}"
					end

					return payment_successful topic_name
				else
					@failed_payment = FailedPayment.new(payment_params)
					@failed_payment.save

					unless user.has_admin_previlages?
						log_payment_activity user, topic_name,  "#{user.first_name} just attempted to purchase this topic with a fake or duplicate Mpesa code, #{topic.name}"
					end

					return invalid_payment_details
				end
			else
				@failed_payment = FailedPayment.new(payment_params)
				@failed_payment.save
				@failed_payment.update_attribute(:amount, cash.amount)

				unless user.has_admin_previlages?
					log_payment_activity user, topic_name, "#{user.first_name} paid less while purchasing this topic, #{topic.name}"
				end

				return invalid_amount
			end
		else
			@failed_payment = FailedPayment.new(payment_params)
			@failed_payment.save

			unless user.has_admin_previlages?
				log_payment_activity user, topic_name,"#{user.first_name} just attempted to purchase this topic with an Mpesa code that is not in our Database, #{topic.name}"
			end
			
			return payment_has_not_been_recieved
		end

	end

	def index
		@payments = Payment.all
	end


	def show
	end

	protected

	def log_payment_activity user, topic_name ,note
		@activity = PaymentActivity.new
		@activity.user_id = user.id
		@activity.topic_id = params[:payment][:topic_id]
		@activity.mpesa_code = params[:payment][:mpesa_code]
		@activity.note = note
		@activity.name = topic_name
		@activity.time = Time.now
		@activity.save
	end

	def mpesa_payment_text_exists code
		d = Sms.where(:mpesa_code => code).first
		# d.present?
	end

	def payment_has_not_been_recieved
		render json: { success: false, error: "The mpesa Payment has not been received, please try again shortly "}, status: :unauthorized
	end

	def invalid_details
	  render json: { success: false, error: "Error with your user details"}, status: :unauthorized
	end

	def invalid_payment_details
	  render json: { success: false, error: "Error that Mpesa code has been used or does not exist!"}, status: :unauthorized
	end

	def invalid_amount
	  render json: { success: false, error: "Error You paid Much less than expected for this service!"}, status: :unauthorized
	end

	def invalid_topic
	  render json: { success: false, error: "couldn't find that topic"}, status: :unauthorized
	end

	def payment_successful topic_name
		render json: { success: true, msg: "The payment was successful, you now own #{topic_name}" }, status: :ok
		# return
	end

	def payment_failed
		render json: { success: false, msg: "your payment failed please check the confirmation code and try again  " }, status: :unprocessable_entity
		# return
	end

	def payment_is_being_processed
		render json: { success: true, msg: "Order has been made"}, status: :ok
	end

	def payment_params
		params.require(:payment).permit(:topic_id,:mpesa_code, :user_id)
	end

	def order_params
		authentication_token = User.find(params[:payment][:user_id]).authentication_token
		order_url = $order_url
		params.permit(authentication_token,order_url)
	end
end