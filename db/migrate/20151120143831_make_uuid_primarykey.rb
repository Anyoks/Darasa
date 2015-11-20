class MakeUuidPrimarykey < ActiveRecord::Migration
  def change
  	remove_column :prices, :id , :integer# remove existing primary key
  	rename_column :prices, :uuid, :id # rename existing UDID column
  	execute "ALTER TABLE prices ADD PRIMARY KEY (id);"
  end
end
