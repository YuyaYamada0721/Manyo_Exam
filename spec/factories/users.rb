FactoryBot.define do
  factory :user do
    user_name { 'foo' }
    user_email { 'foo@foo.com' }
    password { 'foofoo' }
    password_confirmation { 'foofoo' }
    admin { 'true' }
  end
  factory :user2, class: User do
    user_name { 'bar' }
    user_email { 'bar@bar.com' }
    password { 'barbar' }
    password_confirmation { 'barbar' }
    admin { 'false' }
  end
    factory :user3, class: User do
    user_name { 'baz' }
    user_email { 'baz@baz.com' }
    password { 'bazbaz' }
    password_confirmation { 'bazbaz' }
    admin { 'true' }
  end
end
