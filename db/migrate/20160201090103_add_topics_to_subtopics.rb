class AddTopicsToSubtopics < ActiveRecord::Migration
  def change
  	add_column :subtopics, :unit_id, :uuid
  	add_index :subtopics, :unit_id 
    
  end
end