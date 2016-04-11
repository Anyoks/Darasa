class RenameTypeIdToInstitutionTypeId < ActiveRecord::Migration
  def change
  	rename_column :institutions, :type_id, :institution_type_id
  end
end
