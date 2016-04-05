class AddSamplesToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :sample, :Boolean, default: false
  end
end
