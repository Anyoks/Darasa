class AddSemesterToPayment < ActiveRecord::Migration
  def change
    add_reference :payments, :semester, index: true, foreign_key: true
  end
end
