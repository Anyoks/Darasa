class AddIndexToPaymentActivity < ActiveRecord::Migration
  def change
  	add_index :payment_activities, :topic_id 
  	add_index :payment_activities, :user_id 

  end
end
