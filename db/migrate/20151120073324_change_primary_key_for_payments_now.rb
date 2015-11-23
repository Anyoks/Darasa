class ChangePrimaryKeyForPaymentsNow < ActiveRecord::Migration
  def change
  	remove_column :payments, :id # remove existing primary key
  	rename_column :payments, :uuid, :id # rename existing UDID column
  	execute "ALTER TABLE payments ADD PRIMARY KEY (id);"
  end
end
