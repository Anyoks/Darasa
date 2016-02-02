class ChangeUnitIdToTopicId < ActiveRecord::Migration
  def change
  	rename_column :subtopics, :unit_id, :topic_id
  end
end
