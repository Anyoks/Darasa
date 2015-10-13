class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :unit_name
      t.string :attachment
      t.datetime :date

      t.timestamps null: false
    end
  end
end
