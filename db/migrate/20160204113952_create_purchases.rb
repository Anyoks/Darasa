class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :topic_id

      t.timestamps null: false
    end
  end
end
