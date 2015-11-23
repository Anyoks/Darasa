class AddPricesToUnit < ActiveRecord::Migration
  def change
    add_column :units, :answers_price, :float
    add_column :units, :videos_price, :float
  end
end
