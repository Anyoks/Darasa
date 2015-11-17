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
		data = {
			:amount => 1000,
			:description => "payment for this exam #{@exam.title}",
			:type => 'MERCHANT',
			:reference => Time.now.to_i.to_s,
			:first_name => "#{current_user.first_name}",
			:last_name => "#{current_user.first_name}",
			:email => "#{current_user.email}",
			:phonenumber => "#{current_user.phone_number}",
			:currency => 'KES',
			:answers_boought => []
		}

		# callback_url = 

		pesapal.config = {  :callback_url => 'http://0.0.0.0:3000/pesapal/callback',
		                    :consumer_key => "qdThc4z4QDjVI96cM7Oi5F1MF/WPMRbN",
		                    :consumer_secret =>"IS8Grtl5tsypX2jMexTg3CTORxU="
                  		}
		# pay = Payment.new(payment_params)
		 api_v1_pay_path(:params =>{ :exam_id => @exam.id, :user_id => current_user.id, :unit_id => @exam.unit.id, :semester_id => @exam.unit.semester.id })
		#generate iframe
		unit_bought = {}
		 @xml = %[<?xml version="1.0" encoding="utf-8"?>
		<PesapalDirectOrderInfo
		        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		        xmlns:xsd="http://www.w3.org/2001/XMLSchema"

		        Amount="#{data[:amount]}"
		        Currency="#{data[:currency] || 'USD'}"
		        Description="#{data[:description]}"
		        Type="#{data[:merchant] ||'MERCHANT'}"
		        Reference="#{data[:reference]}"
		        FirstName="#{data[:first_name]}"
		        LastName="#{data[:last_name]}"
		        Email="#{data[:email]}"
		        PhoneNumber="#{data[:phone]}"
		        xmlns="http://www.pesapal.com">
		  <lineitems>
		    #{line_items}
		  </lineitems>
		</PesapalDirectOrderInfo>]

		@order_url = @xml
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