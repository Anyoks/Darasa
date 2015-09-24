class AddCourseToYears < ActiveRecord::Migration
  def change
  	course = Course.create! name: "Humanities"
    add_reference :years, :course, index: true, foreign_key: true, default: course.id
  end
end
