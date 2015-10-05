class ChangeSecondName < ActiveRecord::Migration
  def change
  	change_column :users, :second_name, :string, :null => true
  end
end
