class AddFofeignKeysToAllTables < ActiveRecord::Migration
  def change
  	remove_column :exams, :unit_id, :integer
  	remove_column :courses, :university_id, :integer
  	remove_column :payments, :unit_id, :integer
  	remove_column :payments, :exam_id, :integer
  	remove_column :payments, :user_uuid, :integer
  	remove_column :payments, :semester_id, :integer
  	remove_column :questions, :exam_id, :integer
  	remove_column :responses, :question_id, :integer
  	remove_column :semesters, :year_id, :integer
  	remove_column :units, :semester_id, :integer
  	# remove_column :year, :course_id, :integer

  end
end
