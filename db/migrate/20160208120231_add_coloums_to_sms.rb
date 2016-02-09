class AddColoumsToSms < ActiveRecord::Migration
  def change
  	rename_column :sms, :code, :mpesa_code
  	add_column :sms, :amount, :string
  	add_column :sms, :date, :string
  	add_column :sms, :time, :string
  	add_column :sms, :first_name, :string
  	add_column :sms, :last_name, :string

  end
end
