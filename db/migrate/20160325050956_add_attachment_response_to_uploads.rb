class AddAttachmentResponseToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :response
    end
  end

  def self.down
    remove_attachment :uploads, :response
  end
end
