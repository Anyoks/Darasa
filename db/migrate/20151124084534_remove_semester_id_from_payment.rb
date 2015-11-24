class RemoveSemesterIdFromPayment < ActiveRecord::Migration
  def change
  	remove_column :payments, :semester_id, :integer
  	remove_column :payments, :status, :bolean 
  	add_column :payments, :status, :string
  end
end
