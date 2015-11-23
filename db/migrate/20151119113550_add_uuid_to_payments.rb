class AddUuidToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :user_uuid, :uuid
    add_reference :payments, :user, index: true, foreign_key: true
  end
end
