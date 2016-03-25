# == Schema Information
#
# Table name: users
#
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  first_name             :string
#  phone_number           :string
#  university             :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  second_name            :string
#  terms                  :boolean          default(FALSE)
#  provider               :string
#  uid                    :string
#  role_id                :integer
#  terms_updated_at       :datetime
#  authentication_token   :text
#  id                     :uuid             not null, primary key
#  unique_session_id      :string(20)
#  last_seen_at           :datetime
#  last_seen              :datetime
#  deleted_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_paranoid
  before_save :ensure_authentication_token
    belongs_to :role
    before_create :set_default_role
  devise :database_authenticatable, :lastseenable, :registerable, :session_limitable,:token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]
  # validates_acceptance_of :tos_agreement, :allow_nil => true, :accept => true, :on => :create
  has_many :payments, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :failed_payments, dependent: :destroy

  #lOGGIN USER ACTIVITIES
  has_many :unit_activities, :dependent => :destroy
  has_many :topic_activities, :dependent => :destroy
  has_many :question_activities, :dependent => :destroy
  has_many :payment_activities, :dependent => :destroy



	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
		# byebug
		data = access_token.info
		# byebug
		user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
		if user
			return user
		else
			registered_user = User.where(:email => access_token.info.email).first
				if registered_user
					return registered_user
				else
					user = User.create(first_name: data["first_name"], second_name: data["last_name"],
						provider:access_token.provider,
						email: data["email"],
						uid: access_token.uid ,
						password: Devise.friendly_token[0,20],
					)
				end
		end
	end

	def ensure_authentication_token
		if authentication_token.blank?
			self.authentication_token = generate_authentication_token
	 	end
	end

	def check_user_role
		if is_moderator?
			accept_terms
		end
	end
	#check if the user has accepted terms and conditions. By defauts, it's false
	def accept_terms
		self.terms
	end

	def is_admin?
		if self.role.nil?
			false
		elsif self.role.name == "admin"
			true
		else
			false
		end
	end
	
	#if the user has not accepted terms and conditions, they are not a moderator!
	def is_moderator?
		# if accept_terms
		# 	if self.role.nil? #they could be an admin!
		# 		make_moderator
		# 	elsif
		# 		self.role.name =='moderator'
		# 		true
		# 	else
		# 		false
		# 	end
		# else
		# 	false
		# end
		if self.role.nil?
			false
		elsif self.role.name == "moderator"
			true
		else
			false
		end
	end

	def has_admin_previlages?
		if is_admin? || is_moderator?
			# if is_moderator?
			# 	 p "Yes moderator"
			# 	 true
			# elsif is_admin?
			# 	 "Yes Admin"
			# end
			true
		else
			false
		end
	end

	def agree_tos
		self.update_attributes :terms => true, :terms_updated_at => Time.now
		make_moderator
	end

	def make_moderator
		self.update_attributes :role_id => 3
		# self.role ||= Role.find_by_name('moderator') 
	end

	def make_admin
		self.update_attributes :role_id => 4
	end

	def make_normal_user
		self.update_attributes :role_id => 1
	end

	def show_admins
		User.where(:role_id => 4 )
	end

	#checking if the user has paid to view the answers

	def has_paid? topic_id
		if self.payments.first.nil? #check if there's a payment record, before we do a look up in the db will save us some time :-)
			check_if_this_unit_is_paid_for topic_id
		else
			check_if_this_unit_is_paid_for topic_id # have you really paid fro this unit?
		end
	end

	def owns? topic_id
		if self.purchases.first.nil?
			false
		else
			check_if_topic_is_in_my_assets topic_id
		end
	end

	private
	# Making all users' role to be registered as they sign up.
	def set_default_role
		self.role ||= Role.find_by_name('registered') 
	end

	def generate_authentication_token
		loop do
			token = Devise.friendly_token
			break token unless User.where(authentication_token: token).first
		end
	end
	def empty?
		self.empty?
	end

	def check_if_topic_is_in_my_assets topic_id
		@assets = self.purchases
		if @assets.find_by_topic_id(topic_id).nil?
			false
		else
			true
		end
	end



	def check_if_this_unit_is_paid_for topic_id
		@payment = self.payments
		if @payment.present? #has the user made any Payments?
			if @payment.find_by_topic_id(topic_id).nil? #If not no need to check further!
				false
			else
				true
			end
		else
			false
		end
	end

end
