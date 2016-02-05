class AddIndexToFailedPayments < ActiveRecord::Migration
  def change
  	 add_index :failed_payments, :topic_id 
  	 add_index :failed_payments, :user_id 
  end
end
