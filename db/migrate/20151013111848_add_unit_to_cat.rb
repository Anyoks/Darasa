class AddUnitToCat < ActiveRecord::Migration
  def change
  	unit = Unit.create! name: "Management Information Systems" # lets make sure even the existing  topics have a unit name and id :-)
    add_reference :cats, :unit, index: true, foreign_key: true, default: unit.id
  end
end
