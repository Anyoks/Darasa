class AddQuestionToExam < ActiveRecord::Migration
  def change
  	add_column :exams, :question, :text
  	rename_column :exams, :exam_name, :title
  end
end
