class UserInfo < ActiveRecord::Base

  validates :StudentID, uniqueness: true
  validates :Name, uniqueness: true, presence: true, length: {maximum: 255}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false}, presence: true, length: {maximum: 50},
    format: {with: VALID_EMAIL_REGEX}

  has_secure_password

  belongs_to :role
end
