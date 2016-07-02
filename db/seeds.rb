# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Alexey', surname: 'Batrachenko', email: 'zzzaqxswcdevfrbgt98@gmail.com', password: '123456', password_confirmation: '123456')
Hotel.create(title: 'Rosewood London', rating: 'Bad', breakfast_included: 'With', room_description:'bad rooms', photo: 'none', price: 100, address: '1252 High Holborn')
Hotel.create(title: 'Mentone Hotel', rating: 'Very good', breakfast_included: 'Without', room_description:'nice rooms', photo: 'none', price: 1234.4, address: '1 Kensington Court')