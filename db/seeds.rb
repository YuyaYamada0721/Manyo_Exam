User.create!(
  [
  { user_name: 'yamada', user_email: 'yamada@yamada.com', password: 'yamada', password_confirmation: 'yamada', admin: true },
  { user_name: 'yamada2', user_email: 'yamada2@yamada.com', password: 'yamada2', password_confirmation: 'yamada2', admin: true },
  { user_name: 'yamada3', user_email: 'yamada3@yamada.com', password: 'yamada3', password_confirmation: 'yamada3', admin: false },
  { user_name: 'yamada4', user_email: 'yamada4@yamada.com', password: 'yamada4', password_confirmation: 'yamada4', admin: false },
  { user_name: 'yamada5', user_email: 'yamada5@yamada.com', password: 'yamada5', password_confirmation: 'yamada5', admin: false },
  { user_name: 'yamada6', user_email: 'yamada6@yamada.com', password: 'yamada6', password_confirmation: 'yamada6', admin: false },
  { user_name: 'yamada7', user_email: 'yamada7@yamada.com', password: 'yamada7', password_confirmation: 'yamada7', admin: false },
  { user_name: 'yamada8', user_email: 'yamada8@yamada.com', password: 'yamada8', password_confirmation: 'yamada8', admin: false },
  { user_name: 'yamada9', user_email: 'yamada9@yamada.com', password: 'yamada9', password_confirmation: 'yamada9', admin: false },
  { user_name: 'yamada10', user_email: 'yamada10@yamada.com', password: 'yamada10', password_confirmation: 'yamada10', admin: false }
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
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 1},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 1},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 1},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 2},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 2},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 2},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 3},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 3},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 3},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 4},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 4},
    { task_name: 'test', task_content: 'test', expiration_deadline: Time.current, user_id: 4}
  ]
)
