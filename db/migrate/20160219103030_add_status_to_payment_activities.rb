class AddStatusToPaymentActivities < ActiveRecord::Migration
  def change
    add_column :payment_activities, :status, :string
  end
end
