class AddSubtopicToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :subtopic_id, :uuid
  end
end
