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
		@unit = Unit.find(params[:unit_id])

		@payment = Payment.new(payment_params)

		if @payment.save

			# order_params = {
			# 	unit_id: params[:unit_id],
			# 	user_id: params[:user]
			# }

			# pesapal = Pesapal::Merchant.new
			@reference = params[:user_id] + '888' + params[:unit_id]
			
			data = {
				amount: @unit.price.amount,
				description: "payment for this unit #{@unit.name}",
				type: 'MERCHANT',
				reference: "#{@reference}", #Time.now.to_i.to_s, #must be unique || I can generate a reference that is related to a user_id and unit_id and user this to identify a trasactions
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
				unit_id: @unit.id,
				semester_id: @unit.semester.id,
				unit_cost: @unit.answers_price,
				sub_total: @unit.answers_price
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
	                              particulars="#{line_item[:unit_id]}"
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

			   # 

			 #**Now I need to execute the url**#

			 #**Make sure the url is uri**#

			@get_order_execute =  URI(@order_url)

			 #**this returns a page**#

			@set_order = Net::HTTP.get(@get_order_execute)

			$order_url = @order_url

			@data = data


			

			# render @set_order
			# order_url @order_url

			render "index" #:inline => "<%= @set_order.html_content %>"
		else
			invalid_details
		end



		  # respond_to do |format|
		  #   format.html { render :text => @set_order.html_content }
		  # end

		# redirect_to api_v1_processpayment_process_path(@data)  #/api/v1/processpayment/process

		# respond_to do |format|
		# 	if @order_url.nil?
		# 		# format.html { redirect_to @unit, notice: 'unit was successfully created.' }
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

	def invalid_details
	  render json: { success: false, message: "Error with your payment details"}, status: :unauthorized
	end

	def order_url url
		@order_url = url
		respond_to do |format|
			format.html {render "index"}
			format.json { render json: { success: true, order_url: @order_url }, status: :ok }
		end

		# render json: { success: true, order_url: @order_url }, status: :ok
	end

	def show
		@order_url = $order_url  #Pesapal::OrderUrl.new(@xml, @call_back_url, true).url.html_safe
		# $order_url 

	end

	protected

		def payment_params
			@unit = Unit.find(params[:unit_id])
			params.permit(:user_id, :unit_id)
		end
end