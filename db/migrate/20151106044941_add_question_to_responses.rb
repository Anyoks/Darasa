class AddQuestionToResponses < ActiveRecord::Migration
  def change
  	question = Question.create! question: " Why are you in school", exam_id: "#{Unit.first.id}"
    add_reference :responses, :question, index: true, foreign_key: true, default: question.id
  end
end
