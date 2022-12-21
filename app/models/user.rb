class User < ApplicationRecord
  has_secure_password
  # before_save :default_values

  validates :role, inclusion: { in: %w[admin user agent] }

  # private

  # def set_defaults
  #   role = "user" if role.blank?
  # end


  # def default_values
  #   self.role = 'user' # note self.status = 'P' if self.status.nil? might better for boolean fields (per @frontendbeauty)
  # end
end
