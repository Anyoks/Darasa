class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    belongs_to :role
    before_create :set_default_role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]
  # validates_acceptance_of :tos_agreement, :allow_nil => true, :accept => true, :on => :create

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
		self.role.name == "admin"
	end
	
	#if the user has not accepted terms and conditions, they are not a moderator!
	def is_moderator?
		if accept_terms
			self.role ||= Role.find_by_name('moderator') 
			self.role.name == "moderator"
		else
			false
		end
	end

	def agree_tos
		self.update_attributes :terms => true, :terms_updated_at => Time.now
	end



	private
	# Making all users' role to be registered as they sign up.
	def set_default_role
		self.role ||= Role.find_by_name('registered') 
	end

	# def is_dmin?
	# 	self.role.name == "admin"
	# end

end
