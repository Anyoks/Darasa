class CreateCampus < ActiveRecord::Migration
  def change
    create_table :campus do |t|
      t.string :campus_name
      t.string :location
      t.uuid :institution_id

      t.timestamps null: false
    end
    add_index :campus, :institution_id 
  end
end
