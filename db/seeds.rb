Category.create name: "Food"
Category.create name: "Drink"

2.upto(20) do |n|
  email = "user#{n+1}@framgia.com"
  password = "12345678"
  User.create!(
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
5.times do |n|
  content = "This is suggestion #{n+1}"
  users.each { |user| user.suggestions.create!(content: content)}
end
