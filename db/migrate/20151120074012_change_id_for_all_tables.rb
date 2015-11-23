class ChangeIdForAllTables < ActiveRecord::Migration
  def change
	remove_column :responses, :id # remove existing primary key
  	rename_column :responses, :uuid, :id # rename existing UDID column
  	execute "ALTER TABLE responses ADD PRIMARY KEY (id);"

  

  	
  end
end
