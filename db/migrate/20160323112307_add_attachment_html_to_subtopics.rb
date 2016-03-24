class AddAttachmentHtmlToSubtopics < ActiveRecord::Migration
  def self.up
    change_table :subtopics do |t|
      t.attachment :html
    end
  end

  def self.down
    remove_attachment :subtopics, :html
  end
end
