class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :unit_name
      t.string :attachment
      t.datetime :date

      t.timestamps null: false
    end
  end
end
