class AddAvailableToUnits < ActiveRecord::Migration
  def change
    add_column :units, :available, :boolean, :default => :false
  end
end
