class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_units, :find_semesters, :find_years, :find_courses, :find_universities #every singel action in this app will run this code

  def find_units
  	@units = Unit.all
  end

  def find_semesters
  	@semesters = Semester.all
  end

  def find_years
    @years = Year.all
  end

  def find_courses
    @courses = Course.all
  end

  def find_universities
    @universities = University.all
  end
end
