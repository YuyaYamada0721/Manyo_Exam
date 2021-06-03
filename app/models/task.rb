class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 100 }
  validates :task_content, presence: true

  enum status: {
    未着手: 0,
    着手中: 1,
    完了: 2
  }

  scope :task_name_fuzzy_search, ->(params) { where('task_name LIKE ?', "%#{params}%") }
  scope :status_search, ->(params) { where(status: params) }

end
