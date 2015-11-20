# == Schema Information
#
# Table name: payments
#
#  id                                                              :integer          not null, primary key
#  status                                                          :boolean
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  unit_id                                                         :integer
#  semester_id                                                     :integer
#  exam_id                                                         :integer
#  pesapal_merchant_reference                                      :string
#  pesapal_transaction_tracking_id                                 :string
#  user_uuid                                                       :uuid
#  {:foreign_key_type=>:uuid, :index=>true, :foreign_key=>true}_id :integer
#

class Payment < ActiveRecord::Base
	belongs_to :user

	# validates_presence_of :user_id, :unit_id, :semester_id

	# params.permit(params[:pesapal_merchant_reference],params[:pesapal_transaction_tracking_id],@user_payment_details[:user_id], @user_payment_details[:exam_id], @user_payment_details[:semester_id], @user_payment_details[:unit_id])

	def save_user user_id, unit_id, semester_id, exam_id
		user_id = User.find_by_uuid(user_id)
		semester_id = Semester.find_by_uuid(semester_id)
		exam_id = Exam.find_by_uuid(exam_id)
		unit_id = Unit.find_by_uuid(unit_id)
	end

end
