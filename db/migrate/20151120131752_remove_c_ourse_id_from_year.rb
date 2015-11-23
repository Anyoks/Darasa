class RemoveCOurseIdFromYear < ActiveRecord::Migration
  def change
  	remove_column :years, :course_id, :integer
  	add_column :years, :course_id, :uuid
  	add_index :years ,:course_id
  end
end
