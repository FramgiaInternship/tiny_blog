User.create!(
  name: "Tran Dai Son",
  email: "sontd.it@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

35.times do |n|
  name = Faker::Name.name
  email = "user_#{n + 1}@example.com"
  password = "123456"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end

users = User.order(:created_at).take(6)
35.times do
  title = Faker::Lorem.sentence(5)
  content = Faker::Lorem.sentence(15)
  users.each { |user| user.entries.create!(title: title, content: content) }
end
