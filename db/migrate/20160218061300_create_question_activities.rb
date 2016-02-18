class CreateQuestionActivities < ActiveRecord::Migration
  def change
    create_table :question_activities, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :question_id
      t.datetime :time

      t.timestamps null: false
    end
  end
end
