class RemoveAttachmentFromSubtopics < ActiveRecord::Migration
  def change
  	remove_attachment :subtopics, :html
  	remove_attachment :questions, :html
  	
  end
end
