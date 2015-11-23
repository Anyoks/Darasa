class AddPriceToUnit < ActiveRecord::Migration
  def change
  	add_column :units, :price_id, :uuid
  	add_index :units ,:price_id
  end
end
