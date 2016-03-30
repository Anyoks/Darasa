class AddTypeIdToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :type_id, :uuid
    add_index :institutions, :type_id 
  end
end
