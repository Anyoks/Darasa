class RemoveColoumnFromPayments < ActiveRecord::Migration
  def change
  	# remove_column :payments, :semester_id, :integer
  	remove_column :payments, :order_url, :string
  	remove_column :payments, :pesapal_transaction_tracking_id, :string

  	rename_column :payments, :pesapal_merchant_reference, :mpesa_code
  	rename_column :payments, :unit_id, :topic_id
  	
  end
end
