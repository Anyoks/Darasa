class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :code
      t.string :attachment

      t.timestamps null: false
    end
  end
end
