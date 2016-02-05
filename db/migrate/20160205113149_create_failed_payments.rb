class CreateFailedPayments < ActiveRecord::Migration
  def change
    create_table :failed_payments, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :topic_id

      t.timestamps null: false
    end
  end
end
