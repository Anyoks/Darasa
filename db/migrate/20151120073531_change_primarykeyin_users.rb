class ChangePrimarykeyinUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :id # remove existing primary key
  	rename_column :users, :uuid, :id # rename existing UDID column
  	execute "ALTER TABLE users ADD PRIMARY KEY (id);"
  end
end
