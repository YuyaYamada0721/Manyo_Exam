class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 100 }
  validates :task_content, presence: true
end
