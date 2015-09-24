class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :year

      t.timestamps null: false
    end
  end
end
