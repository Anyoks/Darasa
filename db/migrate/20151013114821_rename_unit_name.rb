class RenameUnitName < ActiveRecord::Migration
  def change
  	rename_column :cats, :unit_name, :cat_name
  end
end
