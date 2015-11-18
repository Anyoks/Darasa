class AddUuidToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :uuid, :uuid, :default => "uuid_generate_v4()"
  end
end
