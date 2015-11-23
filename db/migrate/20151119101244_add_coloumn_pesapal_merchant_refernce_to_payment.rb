class AddColoumnPesapalMerchantRefernceToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :pesapal_merchant_reference, :string
  end
end
