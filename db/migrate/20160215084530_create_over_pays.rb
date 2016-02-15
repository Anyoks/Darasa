class CreateOverPays < ActiveRecord::Migration
  def change
    create_table :over_pays do |t|
      t.string :topic_id
      t.string :mpesa_code
      t.string :user_id
      t.string :amount

      t.timestamps null: false
    end
  end
end
