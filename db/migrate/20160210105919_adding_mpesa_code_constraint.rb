class AddingMpesaCodeConstraint < ActiveRecord::Migration
  def change
  	change_column :payments, :mpesa_code, :string, :null => false
  end
end
