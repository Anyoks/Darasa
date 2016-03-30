class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems, id: :uuid do |t|
      t.string :system_name
      t.text :description

      t.timestamps null: false
    end
  end
end
