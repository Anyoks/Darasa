class AddColoumnPesapalTransactionTrackingIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :pesapal_transaction_tracking_id, :string
  end
end
