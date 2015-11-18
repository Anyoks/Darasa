class AddUuidToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :uuid, :uuid, :default => "uuid_generate_v4()"
  end
end