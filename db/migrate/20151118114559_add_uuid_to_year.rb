class AddUuidToYear < ActiveRecord::Migration
  def change
    add_column :years, :uuid, :uuid, :default => "uuid_generate_v4()"
  end
end
