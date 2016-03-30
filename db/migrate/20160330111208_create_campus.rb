class CreateCampus < ActiveRecord::Migration
  def change
    create_table :campus, id: :uuid do |t|
      t.string :campus_name
      t.string :location
      t.uuid :institution_id

      t.timestamps null: false
    end
    add_index :campus, :institution_id 
  end
end
