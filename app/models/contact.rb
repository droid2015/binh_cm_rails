class Contact < ActiveRecord::Base
	belongs_to :user
  	default_scope -> {order(fullname: :asc)}
	VALID_PHONE_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/
	validates :fullname,presence:true,length: {maximum:255},uniqueness: {case_sensitive: false}
	validates :phonenumber,presence:true, length:{minimum:8},format: { with: VALID_PHONE_REGEX }	  	
end
