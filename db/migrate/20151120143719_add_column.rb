class AddColumn < ActiveRecord::Migration
  def change
  	add_column :prices, :uuid, :uuid, :default => "uuid_generate_v4()"
  end
end
