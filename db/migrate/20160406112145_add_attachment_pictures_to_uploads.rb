class AddAttachmentPicturesToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :pictures
    end
  end

  def self.down
    remove_attachment :uploads, :pictures
  end
end
