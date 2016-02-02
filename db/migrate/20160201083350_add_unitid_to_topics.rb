class AddUnitidToTopics < ActiveRecord::Migration
  def change
  	# topic = Topic.create! name: "Capital Budgeting", code: "AAAAA", unit: Unit.first
  	remove_index :topics, :unit_id
  	remove_column :topics, :unit_id, :integer
  	add_column :topics, :unit_id, :uuid
  	# topic = Topic.create! name: "Capital Budgeting", code: "AAAAA", unit: Unit.first
  	add_index :topics, :unit_id #, :default => topic.id
  end
end
