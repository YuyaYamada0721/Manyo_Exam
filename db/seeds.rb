User.create!(
  [
  { user_name: 'yamada', user_email: 'yamada@yamada.com', password: 'yamada', password_confirmation: 'yamada', admin: true },
  { user_name: 'yamada2', user_email: 'yamada2@yamada.com', password: 'yamada2', password_confirmation: 'yamada2', admin: true }
  ]
)

8.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(
    user_name: name,
    user_email: email,
    password: password,
    password_confirmation: password,
    admin: false
  )
end

Label.create!(
  [
  { label_name: "Ruby" },
  { label_name: "Rails" },
  { label_name: "Python" },
  { label_name: "Java" },
  { label_name: "JavaScript" },
  { label_name: "PHP" },
  { label_name: "HTML" },
  { label_name: "CSS" },
  { label_name: "VBS" },
  { label_name: "GGG" }
  ]
)

10.time do |n|
  task_name = Faker::Games::Pokemon.move
  task_content = Faker::Games::Pokemon.location
  expiration_deadline = Faker::Date.between(from: '2021-06-01', to: '2021-07-01')
  user_id = n + 1
  Task.create!(
    task_name: task_name,
    task_content: task_content,
    expiration_deadline: expiration_deadline,
    user_id: user_id
  )
end
