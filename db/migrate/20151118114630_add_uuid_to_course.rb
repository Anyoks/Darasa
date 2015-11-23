class AddUuidToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :uuid, :uuid, :default => "uuid_generate_v4()"
  end
end
