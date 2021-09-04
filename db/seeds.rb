User.create!(
  [
    { username: 'yamada', email: 'yamada@yamada.com', password: 'yamada', password_confirmation: 'yamada',
      admin: true },
    { username: 'yamada2', email: 'yamada2@yamada.com', password: 'yamada2', password_confirmation: 'yamada2',
      admin: true },
    { username: 'yamada3', email: 'yamada3@yamada.com', password: 'yamada3', password_confirmation: 'yamada3',
      admin: false },
    { username: 'yamada4', email: 'yamada4@yamada.com', password: 'yamada4', password_confirmation: 'yamada4',
      admin: false },
    { username: 'yamada5', email: 'yamada5@yamada.com', password: 'yamada5', password_confirmation: 'yamada5',
      admin: false },
    { username: 'yamada6', email: 'yamada6@yamada.com', password: 'yamada6', password_confirmation: 'yamada6',
      admin: false },
    { username: 'yamada7', email: 'yamada7@yamada.com', password: 'yamada7', password_confirmation: 'yamada7',
      admin: false },
    { username: 'yamada8', email: 'yamada8@yamada.com', password: 'yamada8', password_confirmation: 'yamada8',
      admin: false },
    { username: 'yamada9', email: 'yamada9@yamada.com', password: 'yamada9', password_confirmation: 'yamada9',
      admin: false },
    { username: 'yamada10', email: 'yamada10@yamada.com', password: 'yamada10', password_confirmation: 'yamada10',
      admin: false }
  ]
)

Label.create!(
  [
    { label_name: 'Ruby' },
    { label_name: 'Rails' },
    { label_name: 'Python' },
    { label_name: 'Java' },
    { label_name: 'JavaScript' },
    { label_name: 'PHP' },
    { label_name: 'HTML' },
    { label_name: 'CSS' },
    { label_name: 'VBS' },
    { label_name: 'GGG' }
  ]
)

Task.create!(
  [
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 1 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 1 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 1 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 2 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 2 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 2 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 3 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 3 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 3 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 4 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 4 },
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 4 }
  ]
)
