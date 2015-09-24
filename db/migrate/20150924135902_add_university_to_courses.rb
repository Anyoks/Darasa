class AddUniversityToCourses < ActiveRecord::Migration
  def change
  	uni = University.create! name: "University of Nairobi"
    add_reference :courses, :university, index: true, foreign_key: true, default: uni.id
  end
end
