class AddAttachmentHtmlToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :html
    end
  end

  def self.down
    remove_attachment :questions, :html
  end
end
