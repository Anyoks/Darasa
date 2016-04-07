class AddInstitutionIdToUnit < ActiveRecord::Migration
  def change
  	institution = Institution.first
    add_column :units, :institution_id, :uuid, default: institution.id
    add_index :units, :institution_id 
  end
end
