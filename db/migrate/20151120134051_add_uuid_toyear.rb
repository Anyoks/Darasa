class AddUuidToyear < ActiveRecord::Migration
  def change
  	add_column :years, :course_id, :uuid
  	add_index :years ,:course_id
  end
end
