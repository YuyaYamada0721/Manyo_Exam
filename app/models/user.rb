class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  before_validation { email.downcase! }

  has_many :tasks, dependent: :destroy

  after_destroy :last_admin_check
  after_update :last_admin_check

  def last_admin_check
    return unless User.where(admin: true).count.zero?

    raise ActiveRecord::Rollback
  end
end
