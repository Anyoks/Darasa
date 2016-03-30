class RenameColumnInCourse < ActiveRecord::Migration
  def change
  	rename_column :courses, :university_id, :institution_id
  end
end
