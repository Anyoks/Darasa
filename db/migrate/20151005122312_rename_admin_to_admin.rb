class RenameAdminToAdmin < ActiveRecord::Migration
  def change
  	rename_column :users, :admim, :admin
  end
end
