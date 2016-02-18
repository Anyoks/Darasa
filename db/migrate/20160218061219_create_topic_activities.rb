class CreateTopicActivities < ActiveRecord::Migration
  def change
    create_table :topic_activities, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :topic_id
      t.datetime :time

      t.timestamps null: false
    end
  end
end
