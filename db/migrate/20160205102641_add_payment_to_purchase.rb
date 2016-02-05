class AddPaymentToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :payment_id, :uuid
    add_index :purchases, :payment_id 

  end
end
