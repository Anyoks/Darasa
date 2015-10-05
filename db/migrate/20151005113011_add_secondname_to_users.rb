class AddSecondnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :second_name, :string, :null => false
  end
end
