User.create! email: "admin@example.com", password: "123456",
  password_confirmation: "123456", is_admin: true
10.times do
  User.create! email: Faker::Internet.email, password: 123456,
    password_confirmation: 123456, name: Faker::Name.name
end

users = User.order :created_at
20.times do
  users.each{|user| user.posts.create! title: Faker::Book.title,
    content: Faker::Lorem.sentence(100)}
end
