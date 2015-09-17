class AddUnitToTopics < ActiveRecord::Migration
  def change
  	unit = Unit.create! name: "No unit" # lets make sure even the existing  topics have a unit name and id :-)
    add_reference :topics, :unit, index: true, foreign_key: true, default: unit.id
  end
end
