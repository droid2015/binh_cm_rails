
class User < ActiveRecord::Base
	attr_accessor :remember_token
	has_many :contact
	before_save {self.email = email.downcase}
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
		format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
	has_secure_password
	validates :password, length: {minimum: 4},allow_blank:true
	def self.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        #cost=10                           
        BCrypt::Password.create(string, cost: cost)
	end
	# Returns a random token. Số random 22 ky tu
  	def self.new_token
    	SecureRandom.urlsafe_base64
	end
	def remember
		self.remember_token=User.new_token
		update_attribute(:remember_token,User.digest(remember_token))
	end
	# Returns true if the given token matches the digest.
    def authenticated?(remember_token)
    	return false if remember_digest.nil?
    	BCrypt::Password.new(remember_digest).is_password?(remember_token)
		#BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end
	#Xoá remember_digest
	def forget
		update_attribute(:remember_digest,nil)
	end
end
