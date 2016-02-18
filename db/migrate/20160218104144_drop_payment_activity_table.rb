class DropPaymentActivityTable < ActiveRecord::Migration
  def change
  	drop_table :payment_activities
  end
end
