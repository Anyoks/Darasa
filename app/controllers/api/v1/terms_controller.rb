class Api::V1::TermsController < ApplicationController
	before_filter :authenticate_user!, except: [:show]
	respond_to :json
	def show

		resource =  Term.first

		return no_terms unless resource
		render json: { success: true, text: resource.terms}, status: :ok

	end

	def no_terms
		render json: { success: false, error: "No terms"}, status: :unprocessable_entity
	end
end
