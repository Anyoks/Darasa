class AddIndexToPurchase < ActiveRecord::Migration
  def change
  	add_index :purchases, :topic_id 
  	add_index :purchases, :user_id 
  end
end
