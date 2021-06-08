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

Task.create!(
  [
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 1.day, status: 1, priority: 1, user_id: 1},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 2.day, status: 1, priority: 1, user_id: 1},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 3.day, status: 1, priority: 1, user_id: 1},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 4.day, status: 1, priority: 1, user_id: 2},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 5.day, status: 1, priority: 1, user_id: 2},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 6.day, status: 1, priority: 1, user_id: 2},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 7.day, status: 1, priority: 1, user_id: 3},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 8.day, status: 1, priority: 1, user_id: 3},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 9.day, status: 1, priority: 1, user_id: 3},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current + 10.day, status: 1, priority: 1, user_id: 4},
  ]
  )

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
