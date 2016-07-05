namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    20.times do |n|
      name  = Faker::Name.first_name
      surname = Faker::Name.last_name
      email = "example-#{n+1}@gmail.com"
      password  = "password"
      User.create!(name: name,
                   surname: surname,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end