class RenameUniversitiesToInstitusions < ActiveRecord::Migration
  def change
  	rename_table :universities, :institutions
  end
end
