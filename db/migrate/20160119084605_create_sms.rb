class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms, id: :uuid do |t|
      t.text :message
      t.string :phone
      t.string :code

      t.timestamps null: false
    end
  end
end
