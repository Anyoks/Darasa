class Api::V1::TermsController < ApplicationController
	before_filter :authenticate_user!, except: [:show]
	respond_to :json
	def show

		resource =  Term.first
	# byebug
		render json: { success: true, text: resource.terms}, status: :ok
		# return
		# invalid_user
	end
end
