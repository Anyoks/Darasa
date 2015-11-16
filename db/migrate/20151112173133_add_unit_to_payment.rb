class AddUnitToPayment < ActiveRecord::Migration
  def change
    add_reference :payments, :unit, index: true, foreign_key: true
  end
end
