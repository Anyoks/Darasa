class Api::V1::PaymentsController < ApplicationController
	before_filter :authenticate_user!

	# require 'oauth.rb'
	require 'api/v1/oauths_controller'
	require 'api/v1/merchants_controller'
	require 'api/v1/posts_controller'
	require 'htmlentities'



	def pay
		@exam = Exam.find(params[:exam_id])
			

		
		pesapal = Pesapal::Merchant.new
		# byebug
		order_details = {
			:amount => 1000,
			:description => "payment for this #{@exam.title}",
			:type => 'MERCHANT',
			:reference => '808-707-606',
			:first_name => "#{current_user.first_name}",
			:last_name => "#{current_user.first_name}",
			:email => "current_user.email",
			:phonenumber => " ",
			:currency => 'KES'
		}

		# callback_url = 

		pesapal.config = {  :callback_url => 'http://0.0.0.0:3000/pesapal/callback',
		                    :consumer_key => "qdThc4z4QDjVI96cM7Oi5F1MF/WPMRbN",
		                    :consumer_secret =>"IS8Grtl5tsypX2jMexTg3CTORxU="
                  		}
		# pay = Payment.new(payment_params)
		#generate iframe
		@order_url = pesapal.generate_order_url
		# byebug
		# if pay
		# 	pay.save 
		# 		redirect_to @exam, notice: 'Payment was successful.'
		# else
		# 	redirect_to @exam, notice: 'Payment was not successful.'
		# end

		
	end

	protected

		def payment_params
			@exam = Exam.find(params[:exam_id])
			params.permit(:user_id, :unit_id, :semester_id)
		end
end