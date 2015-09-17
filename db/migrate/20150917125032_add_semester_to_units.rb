class AddSemesterToUnits < ActiveRecord::Migration
  def change
  	semester = Semester.create! name: "semester 1"  # lets make sure even the existing  units have a semesster_id :-)
    add_reference :units, :semester, index: true, foreign_key: true, default: semester.id
  end
end
