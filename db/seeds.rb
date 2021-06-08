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

Label.create!(
  [
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
)

Task.create!(
  [
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 1.day, status: 1, priority: 1, user_id: 1},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 2.day, status: 1, priority: 1, user_id: 2},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 3.day, status: 1, priority: 1, user_id: 3},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 4.day, status: 1, priority: 1, user_id: 4},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 5.day, status: 1, priority: 1, user_id: 5},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 6.day, status: 1, priority: 1, user_id: 6},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 7.day, status: 1, priority: 1, user_id: 7},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 8.day, status: 1, priority: 1, user_id: 8},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 9.day, status: 1, priority: 1, user_id: 9},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 10.day, status: 1, priority: 1, user_id:101},
  ]
  )
