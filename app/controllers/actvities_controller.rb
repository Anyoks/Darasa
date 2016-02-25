class ActvitiesController < ApplicationController
  def unit
  	@unit = UnitActivity.all.order(created_at: :desc)
  end

  def topic
  	@topic = TopicActivity.all.order(created_at: :desc)
  end

  def question
  	@question = QuestionActivity.all.order(created_at: :desc)
  end

  # def users
  # 	@unit_users = UnitActivity.
  # 	@topic_users
  # 	@question_users 
  # end
end
