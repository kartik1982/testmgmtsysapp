class User < ApplicationRecord
  before_save {self.email=email.downcase}
  validates :first_name, presence: true, length: {minimum: 3, maximum:50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                      uniqueness: { case_sensitive: false },
                        format: { with: VALID_EMAIL_REGEX }
has_secure_password
has_secure_token
has_many :projects
has_many :releases
has_many :testcycles
has_many :testcases
has_many :testsuites

  def invalidate_token
    self.update_columns(token: nil)
  end

  def self.valid_login?(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    end
  end
end
