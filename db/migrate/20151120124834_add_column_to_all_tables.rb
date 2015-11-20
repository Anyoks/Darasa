class AddColumnToAllTables < ActiveRecord::Migration
  def change
  	add_column :exams, :unit_id, :uuid
  	add_index :exams, :unit_id
  	add_column :courses, :university_id, :uuid
  	add_index :courses, :university_id
  	add_column :payments, :unit_id, :uuid
  	add_index :payments, :unit_id
  	add_column :payments, :user_id, :uuid
  	add_index :payments, :user_id
  	add_column :payments, :semester_id, :uuid
  	add_index :payments, :semester_id
  	add_column :questions, :exam_id, :uuid
  	add_index :questions, :exam_id
  	add_column :responses, :question_id, :uuid
  	add_index :responses, :question_id
  	add_column :semesters, :year_id, :uuid
  	add_index :semesters, :year_id
  	add_column :units, :semester_id, :uuid
  	add_index :units, :semester_id
  end
end
