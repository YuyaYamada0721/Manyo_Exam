class Task < ApplicationRecord
  validates :task_name, presence: true, length: { maximum: 100 }
  validates :task_content, presence: true

  belongs_to :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

  enum status: {
    未着手: 0,
    着手中: 1,
    完了: 2
  }

  enum priority: {
    低: 0,
    中: 1,
    高: 2
  }

  scope :task_name_fuzzy_search, ->(params) { where('task_name LIKE ?', "%#{params}%") }
  scope :status_search, ->(params) { where(status: params) }

  scope :near_the_end, -> { where(expiration_deadline: Time.zone.today..Time.zone.today + 3) }
  scope :expired, -> { where('expiration_deadline < ?', Time.zone.today) }
  scope :completion_excepting, -> { where.not(status: '完了') }
end
