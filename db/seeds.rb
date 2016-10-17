# Users
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

# Entries
users = User.order(:created_at).take(6)
35.times do
  title = Faker::Lorem.sentence(5)
  content = Faker::Lorem.sentence(30)
  users.each {|user| user.entries.create!(title: title, content: content)}
end

# Comments
entries = Entry.order("created_at DESC").take(10)
22.times do
  body = Faker::Lorem.sentence(15)
  user_id = rand(1..36)
  entries.each {|entry| entry.comments.create!(body: body, user_id: user_id)}
end

# Following user
users = User.all
user = users.first
following = users[2..36]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
