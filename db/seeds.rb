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
    { name: 'Ruby' },
    { name: 'Rails' },
    { name: 'Python' },
    { name: 'Java' },
    { name: 'JavaScript' },
    { name: 'PHP' },
    { name: 'HTML' },
    { name: 'CSS' },
    { name: 'VBS' },
    { name: 'GGG' }
  ]
)

Task.create!(
  [
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 1 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 1 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 1 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 2 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 2 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 2 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 3 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 3 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 3 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 4 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 4 },
    { name: 'test', content: 'test', expiration_deadline: Time.current, user_id: 4 }
  ]
)
