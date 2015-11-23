class ChangePrimaryKeyForPayments < ActiveRecord::Migration
  def change
  	add_column :payments, :uuid, :uuid, :default => "uuid_generate_v4()"
  end
end
