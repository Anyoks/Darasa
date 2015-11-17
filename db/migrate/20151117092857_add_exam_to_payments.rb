class AddExamToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :exam, index: true, foreign_key: true
  end
end
