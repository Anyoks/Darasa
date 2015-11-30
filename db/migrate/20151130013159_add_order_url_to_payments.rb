class AddOrderUrlToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :order_url, :string
  end
end
