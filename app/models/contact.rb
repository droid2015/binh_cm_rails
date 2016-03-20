class Contact < ActiveRecord::Base
	validates :fullname,presence:true

end
