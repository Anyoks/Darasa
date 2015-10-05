class RenamePhone < ActiveRecord::Migration
  def change
  	rename_column :users, :phone, :phone_number
  end
end
