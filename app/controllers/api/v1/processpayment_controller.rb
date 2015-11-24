class Api::V1::ProcesspaymentController < ApplicationController
	require 'net/http'
	before_filter :authenticate_user!

	# def initialize
		
	# end

	def process(data)

		##****lets now de-mistify the data we have recieceved*****##

		@info = data



		# @user = current_user

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
byebug
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

		query_every_second_pesapal_every_so_many_seconds(1) do
			if @status == "pesapal_response_data=PENDING"
				@status_check =  URI(@payment_status_url)
			else
				@status
				break
			end
		end

		#***************Now lets check the @status and respond appriately***************#
		#***********pesapal_response_data =<PENDING|COMPLETED|FAILED|INVALID>***********#

		if @status == "pesapal_response_data=COMPLETED"
			#**save if it's successful
			@payment = Payment.new(payment_params)
			# render "/exams"
			byebug
			 if @payment.save(payment_params)
			# 	respond_to do |format|
			# 		format.html { redirect_to "/exam/20", notice: 'you have successfully paid.' }
			# 		format.json { render :show, status: :created }
			# 	end
			redirect_to "/exams", notice: 'Payment was  successful.'
			else
				redirect_to "/exams", notice: 'Payment was not successful.'
				# format.json { render json: @payment.errors, status: :unprocessable_entity }
			end

			
		end
	end

	
	private

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
			semester_id: "4fe26d09-18a2-49b4-b9a9-6a5918c4f3c0" ,#@exam.unit.semester.uuid,
			unit_cost: 150,#@exam.unit.answers_price,
			sub_total: 150,#@exam.unit.answers_price
		}

	

		

		

		data[:answers_bought][0].each do |k,l|
			@user_payment_details[k.to_sym] = l
		end
		# params.permit(params[:pesapal_merchant_reference, :pesapal_transaction_tracking_id ])
		#########*********END TEST DATA**************#########
		# @exam = Exam.find(@user_payment_details[:exam_id])

		params.permit(@user_payment_details[:user_id], @user_payment_details[:unit_id])
	end

	

end
