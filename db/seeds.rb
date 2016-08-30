# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

AdminUser.destroy_all
Reclamo.destroy_all
User.destroy_all
Empresa.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

5.times do |i|
	Empresa.create!(nombre:"empresa #{i}",rubro:"#{i}")
end

5.times do |i|
User.create!(email: "#{i}email@mail.com",password: '123456789',password_confirmation: '123456789')
end


5.times do |i|
a = Reclamo.create!(texto: "reclamo numero #{i}")
a.user=User.find(rand(User.first.id..User.last.id))
a.empresa= Empresa.find(rand(Empresa.first.id..Empresa.last.id))
a.save!

end