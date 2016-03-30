class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :type_name
      t.uuid :system_id

      t.timestamps null: false
    end
    add_index :types, :system_id 
  end
end
