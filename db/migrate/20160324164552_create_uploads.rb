class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads , id: :uuid do |t|
      t.uuid :subtopic_id

      t.timestamps null: false
    end
  end
end
