class AddUuidToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :uuid, :uuid, :default => "uuid_generate_v4()"
  end
end
