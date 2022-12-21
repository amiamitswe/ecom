class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :categories, dependent: :destroy

  validates :role, inclusion: { in: %w[admin user agent] }
  validates :username, presence: true
  validates_length_of :username, maximum: 25, minimum: 3

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true,
            length: { minimum: 3, maximum: 25 }

  has_secure_password
end
