class AddAmountToFailedPayments < ActiveRecord::Migration
  def change
    add_column :failed_payments, :amount, :string
  end
end
