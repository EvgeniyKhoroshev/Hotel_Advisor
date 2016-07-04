namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example",
                 surname: "Example",
                 email: "example@gmail.com",
                 password: "123456",
                 password_confirmation: "123456")
    20.times do |n|
      name  = Faker::Name.name
      surname = Faker::Name.name
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