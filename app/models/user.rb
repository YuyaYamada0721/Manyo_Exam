class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 30 }
  validates :user_email, presence: true, length: { maximum: 255 }, uniqueness: true,
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { user_email.downcase! }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
  has_many :tasks, dependent: :destroy

  after_destroy :last_admin_check
  after_update :last_admin_check

  def last_admin_check
    return unless User.where(admin: true).count.zero?

    raise ActiveRecord::Rollback
  end
end
