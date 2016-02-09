class AddUniquenessToPayments < ActiveRecord::Migration
  def change
  	add_index :payments, :mpesa_code,  unique: true
  	change_column :payments, :mpesa_code, :string#, :null => false
  end
end
