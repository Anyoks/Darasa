class PurchasesController < ApplicationController
  def index
  	@purchases = Purchase.all
  end

  def show
  end
end
