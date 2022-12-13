class User < ApplicationRecord
  has_secure_password
  validates :role, inclusion: { in: %w[admin user agent] }
end
