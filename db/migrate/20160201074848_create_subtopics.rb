class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics, id: :uuid do |t|
      t.text :title

      t.timestamps null: false
    end
  end
end
