class MakeNewModelsParanoid < ActiveRecord::Migration
  def change
  	add_column :types, :deleted_at, :datetime
    add_index :types, :deleted_at

    add_column :campus, :deleted_at, :datetime
    add_index :campus, :deleted_at

    add_column :profiles, :deleted_at, :datetime
    add_index :profiles, :deleted_at

    add_column :systems, :deleted_at, :datetime
    add_index :systems, :deleted_at
  end
end
