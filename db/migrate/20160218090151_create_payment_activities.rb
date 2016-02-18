class CreatePaymentActivities < ActiveRecord::Migration
  def change
    create_table :payment_activities do |t|
      t.uuid :user_id
      t.uuid :topic_id
      t.string :note
      t.string :mpesa_code
      t.datetime :time

      t.timestamps null: false
    end
  end
end
