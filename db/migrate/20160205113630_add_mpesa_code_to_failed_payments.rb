class AddMpesaCodeToFailedPayments < ActiveRecord::Migration
  def change
    add_column :failed_payments, :mpesa_code, :string
  end
end
