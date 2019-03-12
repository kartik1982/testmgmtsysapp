class User < ApplicationRecord
  before_save {self.email=email.downcase}
  validates :first_name, presence: true, length: {minimum: 5, maximum:50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                      uniqueness: { case_sensitive: false },
                        format: { with: VALID_EMAIL_REGEX }
has_secure_password
end
