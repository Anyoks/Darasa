# == Schema Information
#
# Table name: payments
#
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  pesapal_merchant_reference      :string
#  pesapal_transaction_tracking_id :string
#  id                              :uuid             not null, primary key
#  unit_id                         :uuid
#  user_id                         :uuid
#  status                          :string
#  order_url                       :string
#

class Payment < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :user_id, :unit_id

	# params.permit(params[:pesapal_merchant_reference],params[:pesapal_transaction_tracking_id],@user_payment_details[:user_id], @user_payment_details[:exam_id], @user_payment_details[:semester_id], @user_payment_details[:unit_id])

	# def save_user user_id, unit_id, semester_id, exam_id
	# 	user_id = User.find_by_uuid(user_id)
	# 	semester_id = Semester.find_by_uuid(semester_id)
	# 	exam_id = Exam.find_by_uuid(exam_id)
	# 	unit_id = Unit.find_by_uuid(unit_id)
	# end

end
