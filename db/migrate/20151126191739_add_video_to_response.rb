class AddVideoToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :video, :string
  end
end
