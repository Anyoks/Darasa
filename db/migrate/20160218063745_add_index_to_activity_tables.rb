class AddIndexToActivityTables < ActiveRecord::Migration
  def change
  	add_index :unit_activities, :unit_id 
  	add_index :unit_activities, :user_id 

  	add_index :topic_activities, :topic_id 
  	add_index :topic_activities, :user_id 

  	add_index :question_activities, :question_id 
  	add_index :question_activities, :user_id 
  end
end
