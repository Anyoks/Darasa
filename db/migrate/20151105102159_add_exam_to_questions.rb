class AddExamToQuestions < ActiveRecord::Migration
  def change
    exam = Exam.create! title: "Management Information Systems II", date: Time.now , unit_id: "#{Unit.first.id}"# lets make sure even the existing  topics have a unit name and id :-)
    add_reference :questions, :exam, index: true, foreign_key: true, default: exam.id
  end
end
