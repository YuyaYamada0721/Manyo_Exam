users = [
  { user_name: 'yamada', user_email: 'yamada@yamada.com', password: 'yamada', admin: 'true' },
  { user_name: 'yamada2', user_email: 'yamada2@yamada.com', password: 'yamada2', admin: 'true' }
]
User.create! users

10.times do |n|
  User.create!(
    user_name: "test#{n + 1}",
    user_email: "test#{n + 1}@test.com",
    password: "testtest#{n + 1}",
    admin: 'false'
  )
end

10.times do |n|
  user_id = n + 1
  Task.create!(
    task_name: test,
    task_content: test,
    user_id: user_id
  )
end

labels = [
  { label_name: 'A' },
  { label_name: 'B' },
  { label_name: 'C' },
  { label_name: 'D' },
  { label_name: 'E' },
  { label_name: 'F' },
  { label_name: 'G' },
  { label_name: 'H' },
  { label_name: 'I' },
  { label_name: 'J' }
]
Label.create! labels
