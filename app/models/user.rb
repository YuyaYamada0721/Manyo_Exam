class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 30 }
  validates :user_email, presence: true, length: { maximum: 255 }, uniqueness: true,
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { user_email.downcase! }
  has_many :tasks
end
