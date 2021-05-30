FactoryBot.define do
  factory :task do
    task_name { 'test_name' }
    task_content { 'test_content' }
  end
  factory :task2, class: Task do
    task_name { 'test_name2' }
    task_content { 'test_content2' }
    created_at { Time.current + 1.days }
  end
  factory :task3, class: Task do
    task_name { 'test_name3' }
    task_content { 'test_content3' }
    created_at { Time.current + 2.days }
  end
end
