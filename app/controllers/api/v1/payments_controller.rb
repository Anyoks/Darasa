class Api::V1::PaymentsController < ApplicationController
	before_filter :authenticate_user!
	# respond_to :json

	# require 'oauth.rb'
	# require 'api/v1/oauths_controller'
	# require 'api/v1/merchants_controller'
	# require 'api/v1/posts_controller'
	# require 'htmlentities'
	# require 'api/v1/orders_controller'
	# load_and_authorize_resource




	def pay
		@exam = Exam.find(params[:exam_id])

		# order_params = {
		# 	unit_id: params[:unit_id],
		# 	user_id: params[:user]
		# }

		# pesapal = Pesapal::Merchant.new
		
		data = {
			amount: @exam.unit.price.amount,
			description: "payment for this exam #{@exam.title}",
			type: 'MERCHANT',
			reference: Time.now.to_i.to_s, #must be unique
			first_name: "#{current_user.first_name}",
			last_name: "#{current_user.first_name}",
			email: "#{current_user.email}",
			phonenumber: "#{current_user.phone_number}",
			currency: 'KES',
			answers_bought: [] # line_items for the pesapal pesapal_request_data XML
		}


		#*****MUST CHANGE THIS TO A MORE DRY AND SECURE PLACE *****###
		# pesapal.config = {  :callback_url => 'http://0.0.0.0:3000/pesapal/callback',
		                  #   :consumer_key => "qdThc4z4QDjVI96cM7Oi5F1MF/WPMRbN",
		                  #   :consumer_secret =>"IS8Grtl5tsypX2jMexTg3CTORxU="
                  		# }


		#Now insert the details required to know exactly what they are buying
		

		data[:answers_bought] << {
			user_id: current_user.id,
			unit_id: @exam.unit.id,
			exam_id: @exam.id,
			semester_id: @exam.unit.semester.id,
			unit_cost: @exam.unit.answers_price,
			sub_total: @exam.unit.answers_price
		}

		###required attributes  ###
			# Required Atributes:

			# UniqueId = <unique id of the purchased item>

			# Particulars = <description of the item>

			# Quantity = <quantity purchased>

			# UnitCost = <cost per unit of the purchased item>

			# SubTotal =


	
		line_items = ""

		data[:answers_bought].each do |line_item|
			line_items << %Q[<lineitem uniqueid="#{line_item[:user_id]}"
                              particulars="#{line_item[:exam_id]}"
                              quantity="#{line_item[:quantity] || '1'}"
                              unitcost="#{line_item[:unit_cost]}"
                              subtotal="#{line_item[:sub_total]}">
                            </lineitem>]
        end



		##***GENERATING THE XML TO POST WITH THE REQUIRED DATA***##

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


		if Rails.env == "development"
			@call_back_url = "localhost:3000/api/v1/processpayment/process"
		else
			@call_back_url =  "darasa.co.ke/api/v1/processpayment/process"
		end


		 # @order_url = Pesapal::Order.generate_order_url#(data)

		 #****Send this to mobile app****#
		@order_url = Pesapal::OrderUrl.new(@xml, @call_back_url, true).url.html_safe

		   # byebug

		 #**Now I need to execute the url**#

		 #**Make sure the url is uri**#

		@get_order_execute =  URI(@order_url)

		 #**this returns a page**#

		@set_order = Net::HTTP.get(@get_order_execute)

		$order_url = @order_url

		@data = data


		byebug

		# render @set_order

		render "index" #:inline => "<%= @set_order.html_content %>"



		  # respond_to do |format|
		  #   format.html { render :text => @set_order.html_content }
		  # end

		# redirect_to api_v1_processpayment_process_path(@data)  #/api/v1/processpayment/process

		# respond_to do |format|
		# 	if @order_url.nil?
		# 		# format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
		# 	    format.json { render :show, order_url: @order_url}
		# 	else
		# 		format.html { redirect_to api_v1_processpayment_process_path(data) } # redirect_to api_v1_processpayment_process_path(data)# format.html { render :show, order_url: @order_url}
		# 		format.json { render :show, order_url: @order_url}
		# 	end
		# # redirect_to api_v1_processpayment_process_path(data)# format.html { render :show, order_url: @order_url}
		# end

	end

	def index
		    @payments = Payment.all
	    # @user = current_user
	end

	def show
		@order_url = $order_url  #Pesapal::OrderUrl.new(@xml, @call_back_url, true).url.html_safe
		# $order_url 

	end

	protected

		def payment_params
			@exam = Exam.find(params[:exam_id])
			params.permit(:user_id, :unit_id, :semester_id, :exam_id)
		end
end