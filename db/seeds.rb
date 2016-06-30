# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Hotel.create(title: 'Rosewood London', rating: 'Bad', breakfast_included: 0, room_description:'bad rooms', photo: 'none', price: 100, address: '1252 High Holborn')
Hotel.create(title: 'Mentone Hotel', rating: 'Very good', breakfast_included: 1, room_description:'nice rooms', photo: 'none', price: 1234.4, address: '1 Kensington Court')