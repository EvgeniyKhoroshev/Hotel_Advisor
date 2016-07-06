namespace :db do
  desc "Fill database with hotel data"
  task populate: :environment do
    9.times do |n|
      title  = Faker::Name.first_name
      breakfast_included = 'With'
      room_description = Faker::Name.name
      photo = "/public/uploads/hotel/photo/#{n+1}/#{n+1}.jpg"
      price = 100 + (n+1)
      address = Faker::Name.last_name
      user_id = 1
      Hotel.create!(title: title,
                   breakfast_included: breakfast_included,
                   room_description: room_description,
                   photo: photo,
                   price: price,
                   address: address,
                   user_id: user_id)
    end
  end
end