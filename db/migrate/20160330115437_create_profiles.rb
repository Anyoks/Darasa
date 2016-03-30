class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :institution_id
      t.uuid :course_id
      t.uuid :campu_id

      t.timestamps null: false
    end
    add_index :profiles, :user_id
    add_index :profiles, :institution_id 
    add_index :profiles, :course_id
    add_index :profiles, :campu_id
  end
end
