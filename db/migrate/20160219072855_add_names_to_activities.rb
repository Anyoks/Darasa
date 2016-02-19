class AddNamesToActivities < ActiveRecord::Migration
  def change
  	add_column :unit_activities, :name, :string
  	add_column :topic_activities, :name, :string
  	add_column :payment_activities, :name, :string
  	add_column :question_activities, :name, :string
  end
end
