class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admim, :boolean, default: false
  end
end
