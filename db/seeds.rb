# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user=User.new(name: "admin", email: "admin@abc.com", password: "1234", password_confirmation: "1234",admin:"1")
@user.save
99.times do |n|
	fullname=Faker::Name.name
	phonenumber="0#{919272230+n}"
	address=Faker::Address.city
	description=Faker::Company.name
	Contact.create!(fullname:fullname,phonenumber:phonenumber,address:address,description:description,user_id:@user.id)
end