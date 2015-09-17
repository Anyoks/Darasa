class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_units, :find_semesters #every singel action in this app will run this code

  def find_units
  	@units = Unit.all
  end

  def find_semesters
  	@semesters = Semester.all
  end
end
