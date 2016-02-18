class CreateUnitActivities < ActiveRecord::Migration
  def change
    create_table :unit_activities, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :unit_id
      t.datetime :time

      t.timestamps null: false
    end
  end
end
