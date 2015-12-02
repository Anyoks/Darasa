class Api::V1::ProcesspaymentController < ApplicationController
	require 'net/http'
	before_filter :authenticate_user!,  except: [:process]

	# def initialize
		
	# end

	def process data

		# render "/exams", notice: 'Payment is being processed.'

		params.permit! # Permit all Paypal input params

		##****lets now de-mistify the data we have recieceved*****##

		#**We should be receiving this from pesapal**#
		# pesapal_merchant_reference: this is the reference (a unique order id), that you passed to PesaPal when posting the transaction.

		# pesapal_transaction_tracking_id: this is the unique tracking id for this transaction on PesaPal.

		@query_params = {
			pesapal_merchant_reference:  params[:pesapal_merchant_reference],
			pesapal_transaction_tracking_id: params[:pesapal_transaction_tracking_id ]
			} 

		 @payment_status_url = Pesapal::QueryPaymentStatus.new(@query_params[:pesapal_merchant_reference], @query_params[:pesapal_transaction_tracking_id], true).url.html_safe

		# @status= Net::HTTP.get(@payment_status)

		# @pay = Payment.new(payment_params)
		# @status = @payment_status
		# if 

		#****generate a url  for checking the payment status****#
		@status_check =  URI(@payment_status_url)

		#****Now check for the status and store it in the variable*****#

		@status = Net::HTTP.get(@status_check)

		#**Now to query pesapal until we get a failed or Success result"

		def query_every_second_pesapal_every_so_many_seconds(seconds)
			last_time = Time.now
			loop do
				sleep 0.1
				if Time.now - last_time >= seconds
					last_time += seconds
					yield
				end
			end
		end

		@reference = @query_params[:pesapal_merchant_reference].split("888") #decode the reference for db lookup
		@payment = Payment.where("user_id = '#{@reference[0]}'") #&& "unit_id = #{@reference[1]}")

		if @payment
			@payment.each do |payment|
				if payment.unit_id = "#{@reference[1]}"
					payment.update_attribute :pesapal_merchant_reference, @query_params[:pesapal_merchant_reference] #if payment.unit_id = "#{@reference[1]}"
					payment.update_attribute :pesapal_transaction_tracking_id, @query_params[:pesapal_transaction_tracking_id]# if payment.unit_id = "#{@reference[1]}"
				end
			
				# byebug
				if @status == "pesapal_response_data=PENDING"
					 if payment.update_attribute :status, "PENDING"
					 	# payment_is_being_processed
					 	# redirect_to "/exams", notice: 'Payment is being processed.'
					 	# redirect_to :controller => 'exams', :action => 'index'
					 else
					 	invalid_request
					 end
					
				elsif @status == "pesapal_response_data=COMPLETED"
					if payment.update_attribute :status, "COMPLETED"
						# payment_complete
						# redirect_to "/exams", notice: 'Payment is being processed.'
					else
						# invalid_request
						# redirect_to "/exams", notice: 'Payment could not be saved.'
					end
				elsif @status == "pesapal_response_data=INVALID"
					if payment.update_attribute :status, "INVALID"
						# payment_invalid
						# redirect_to "/exams", notice: 'Payment invalid.'
					else
						# invalid_request
						# redirect_to "/exams", notice: 'Payment could not be saved.'
					end
				elsif @status == "pesapal_response_data=FAILED"
					if payment.update_attribute :status, "FAILED"
						# payment_failed
						# redirect_to "/exams", notice: 'Payment failed.'
					else
						# invalid_request
						# redirect_to "/exams", notice: 'Payment could not be saved.'
					end
				end
			end
			# render "/exams", notice: 'Payment is being processed.'
			redirect_to  '/'
			# redirect_to :controller => 'exams', :action => 'index'
		else
			payment_invalid
		end



		
	end

	
	private

	def payment_is_being_processed
		render json: { success: :pending, message: "Your payment is being processed"}, status: :processing
	end

	def invalid_request
		render json: { success: :false, message: "invalid credentails"}, status: :unprocessable_entity
	end
	def payment_complete
		render json: { success: :true, message: "You have successfully paid"}, status: :done
	end
	def payment_invalid
		render json: { success: :false, message: "You have made an invalid payment"}, status: :done
	end
	def payment_failed
		render json: { success: :false, message: "Your payment has failed"}, status: :done
	end

	def payment_params

		#########*********TEST DATA**************#########
		@user_payment_details = {}
		data = {
			amount: 150,#@exam.unit.answers_price,
			description: "payment for this exam-test", #{@exam.title}",
			type: 'MERCHANT',
			reference: Time.now.to_i.to_s, #must be unique
			first_name: "#{current_user.first_name}",
			last_name: "#{current_user.first_name}",
			email: "#{current_user.email}",
			phonenumber: "#{current_user.phone_number}",
			currency: 'KES',
			answers_bought: [] # line_items for the pesapal pesapal_request_data XML
		}

		data[:answers_bought] << {
			user_id:  "0e9312f9-508f-4086-8bf3-5aa59d120406" , #current_user.uuid,
			unit_id: "5e9e8ed3-052f-41a4-b732-9b4e4020ca02",#@exam.unit.uuid,
			# semester_id: "4fe26d09-18a2-49b4-b9a9-6a5918c4f3c0" ,#@exam.unit.semester.uuid,
			unit_cost: 150,#@exam.unit.answers_price,
			sub_total: 150#@exam.unit.answers_price
		}

	

		

		

		data[:answers_bought][0].each do |k,l|
			@user_payment_details[k.to_sym] = l
		end
		# params.permit(params[:pesapal_merchant_reference, :pesapal_transaction_tracking_id ])
		#########*********END TEST DATA**************#########
		# @exam = Exam.find(@user_payment_details[:exam_id])

		params.merge(@user_payment_details[:user_id])
	end

	

end
