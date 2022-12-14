class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }
  has_many :categories, dependent: :destroy

  validates :role, inclusion: { in: %w[admin user agent] }
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_length_of :username, maximum: 25, minimum: 3

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true,  on: :create
  validates_length_of :password, minimum: 4, maximum: 25

  has_secure_password
end
