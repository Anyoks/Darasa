class RenameAdminInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :admin, :terms
  end
end
