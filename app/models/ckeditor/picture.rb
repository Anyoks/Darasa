# == Schema Information
#
# Table name: ckeditor_assets
#
#  id                :integer          not null, primary key
#  data_file_name    :string           not null
#  data_content_type :string
#  data_file_size    :integer
#  assetable_id      :integer
#  assetable_type    :string(30)
#  type              :string(30)
#  width             :integer
#  height            :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Ckeditor::Picture < Ckeditor::Asset
  mount_uploader :data, CkeditorPictureUploader, :mount_on => :data_file_name

  # def set_image_url
  # 	self.role ||= Role.find_by_name('registered') 
  # end

  def url_content

  	if Rails.env["development"]
		url(:content)
  	else
  	domain = "http://darasa.co.ke"
    "#{domain}#{url(:content)}"
	end

  end
end
