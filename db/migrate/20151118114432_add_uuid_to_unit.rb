class AddUuidToUnit < ActiveRecord::Migration
  def change
    add_column :units, :uuid, :uuid, :default => "uuid_generate_v4()"
  end
end
