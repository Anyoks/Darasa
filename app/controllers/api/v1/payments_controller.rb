class Api::V1::PaymentsController < ApplicationController
	# before_filter :authenticate_user!
	before_filter :authenticate_user!, except: [:pay]
	respond_to :json

	# require 'oauth.rb'
	# require 'api/v1/oauths_controller'
	# require 'api/v1/merchants_controller'
	# require 'api/v1/posts_controller'
	# require 'htmlentities'
	# require 'api/v1/orders_controller'
	# load_and_authorize_resource




	def pay
		params.permit!

		user =  User.find_by_authentication_token(params[:auth_token])
		# byebug
		return invalid_details unless user
# byebug

		
		unit = Unit.find_by_id(params[:payment][:unit_id])
		return invalid_unit unless unit

		# user_id = User.find_by_authentication_token(params[:auth_token]).id
		# byebug
		# unit_id = params[:unit_id]
		@payment = Payment.new(payment_params)
		# byebug

		package= params[:payment][:package]



		if @payment.save
				
				#price hard coded
			if package  == "standard"
				# @unit.
				price = 150
			else
				price = 500
			end
			# pesapal = Pesapal::Merchant.new
			@reference = params[:payment][:user_id] + '888' + params[:payment][:unit_id]

			# user  = User.find(params[:id])
			
			data = {
				amount: price,
				description: "payment for this unit #{unit.name}",
				type: 'MERCHANT',
				reference: "#{@reference}", #Time.now.to_i.to_s, #must be unique || I can generate a reference that is related to a user_id and unit_id and user this to identify a trasactions
				first_name: "#{user.first_name}",
				last_name: "#{user.first_name}",
				email: "#{user.email}",
				phonenumber: "#{user.phone_number}",
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
				user_id: user.id,
				unit_id: unit.id,
				semester_id: unit.semester.id,
				unit_cost: price,
				sub_total: price
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


			

			 #****Send this to mobile app****#
			@order_url = Pesapal::OrderUrl.new(@xml, @call_back_url, true).url.html_safe #change true to false when live
			
			@payment.update_attribute :order_url, @order_url
			@payment.update_attribute :status, "PENDING"
			 
			 #**Now I need to execute the url**#

			 #**Make sure the url is uri**#

			@get_order_execute =  URI(@order_url)

			 #**this returns a page**#


			@set_order = Net::HTTP.get(@get_order_execute)

			$order_url = @order_url

			@data = data


			

			# render @set_order
			# order_url @order_url

			payment_is_being_processed # render "index" #:inline => "<%= @set_order.html_content %>"
		else
			invalid_details
		end

	end

	def index
		    @payments = Payment.all
	    # @user = user
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

	def invalid_details
	  render json: { success: false, error: "Error with your payment details"}, status: :unauthorized
	end

	def invalid_unit
	  render json: { success: false, error: "couldn't find that unit"}, status: :unauthorized
	end

	def payment_is_being_processed

		render json: { success: true, msg: "Order has been made"}, status: :ok
	end

		def payment_params
			params.permit!

			# unit = Unit.find(params[:payment][:unit_id])
			# return invalid_unit unless unit
			# params.permit(:auth_token, :payment)
			
			params.require(:payment).permit(:user_id,:unit_id)
		end

		def order_params
			authentication_token = User.find(params[:payment][:user_id]).authentication_token
			order_url = $order_url
			params.permit(authentication_token,order_url)
		end
end