class RenameExamName < ActiveRecord::Migration
  def change
  	rename_column :exams, :unit_name, :exam_name
  end
end
