class PaymentsWorker
	include Sidekiq::Worker
	# sidekiq_options queue: :update_payment_status

	def perform
		Payment.where(status: 'PENDING').each do |payment|
			# exception_catcher {
				merchant_reference = payment.pesapal_merchant_reference # received from pesapal
				transaction_id = payment.pesapal_transaction_tracking_id # received from pesapal

				#create the url to check
				url = Pesapal::QueryPaymentStatus.new(merchant_reference, transaction_id, true).url

				#fetch status
				response = HTTParty.get(url) 

				if response.code == 200
					status = response.body.split("=")[1] if response.body.split('=')[0] == 'pesapal_response_data'

					if status && status != payment.status
						payment.status = status

						payment.save!
					end
				end
			# }
		end
	end

	#Lets Log it. :-)
	def self.rake_logger
		@@rake_logger ||= Logger.new("#{Rails.root}/log/rake_logger.log", 'monthly')
	end

	def self.exception_catcher
		begin
			yield
		rescue Exception => err
			rake_logger.info("E [#{Time.now.utc.iso8601}] ERROR: #{err.message}")
		end
	end


end