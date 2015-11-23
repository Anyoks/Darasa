class FixYear < ActiveRecord::Migration
  def change
  	remove_column :years, :course_id, :integer
  	
  end
end
