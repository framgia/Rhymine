User.create!(
  name:  "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true
)

User.create!(
  name:  "Nguyen Huy Long",
  email: "nguyenhuylong5695@gmail.com",
  password: "123456",
  password_confirmation: "123456"
)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
    name:  name,
    email: email,
    password: password,
    password_confirmation: password)
end

Genre.create! ([
  {name: "Pop"},
  {name: "Ballad"},
  {name: "R&B"},
  {name: "Rap"},
  {name: "Country"},
])
