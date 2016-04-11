class RenameTypeTable < ActiveRecord::Migration
  def change
  	rename_table :types, :institution_types
  end
end
