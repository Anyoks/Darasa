class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :content
      t.float :amount
    end
  end
end
