class AddYearToSemesters < ActiveRecord::Migration
  def change
  	year = Year.create! year: "Year 1"
    add_reference :semesters, :year, index: true, foreign_key: true,default: year.id
  end
end
