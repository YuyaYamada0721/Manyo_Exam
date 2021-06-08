users = [
  { user_name: 'yamada', user_email: 'yamada@yamada.com', password: 'yamada', admin: 'true' },
  { user_name: 'yamada2', user_email: 'yamada2@yamada.com', password: 'yamada2', admin: 'true' }
]
User.create! users

10.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(
    user_name: name,
    user_email: email,
    password: password,
    admin: false
  )
end

Label.create!(
  [
  { label_name: 'AA' },
  { label_name: 'BB' },
  { label_name: 'CC' },
  { label_name: 'DD' },
  { label_name: 'EE' },
  { label_name: 'FF' },
  { label_name: 'GG' },
  { label_name: 'HH' },
  { label_name: 'II' },
  { label_name: 'JJ' }
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
