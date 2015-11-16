class Api::V1::ProcesspaymentController < ApplicationController


	def process
		
		if pay
			pay.save 
				redirect_to @exam, notice: 'Payment was successful.'
		else
			redirect_to @exam, notice: 'Payment was not successful.'
		end
	end
end
