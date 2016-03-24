class AddIndexUpload < ActiveRecord::Migration
  def change
  	add_index :uploads, :subtopic_id 
  end
end
