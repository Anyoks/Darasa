class AddColoumnToActivites < ActiveRecord::Migration
  def change
  	add_column :unit_activities, :note, :string
  	add_column :topic_activities, :note, :string
  	add_column :question_activities, :note, :string
  end
end
