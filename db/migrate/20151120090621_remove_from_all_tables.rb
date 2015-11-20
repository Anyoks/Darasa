class RemoveFromAllTables < ActiveRecord::Migration
  def change

  	 # remove_index :exams, :unit_id
  	 remove_index :courses, :university_id
  	 remove_index :payments, :unit_id
  	 remove_index :payments, :exam_id 
  	 remove_index :payments, :semester_id
  	 remove_index :questions, :exam_id
  	 remove_index :responses, :question_id
  	 remove_index :semesters, :year_id
  	 remove_index :units, :semester_id
  	 remove_index :years, :course_id

  end
end
