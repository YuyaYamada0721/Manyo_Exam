FactoryBot.define do
  factory :task do
    task_name { 'test_name' }
    task_content { 'test_content' }
    expiration_deadline { Time.current + 2.day }
    status { 2 }
    association :user
  end
  factory :task2, class: Task do
    task_name { 'test_name2' }
    task_content { 'test_content2' }
    created_at { Time.current + 1.days }
    expiration_deadline { Time.current + 1.day }
    status { 1 }
  end
  factory :task3, class: Task do
    task_name { 'test_name3' }
    task_content { 'test_content3' }
    created_at { Time.current + 2.days }
    expiration_deadline { Time.current }
    status { 0 }
  end
end
