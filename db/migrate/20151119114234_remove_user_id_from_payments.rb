class RemoveUserIdFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :user_id, :integer
  end
end
