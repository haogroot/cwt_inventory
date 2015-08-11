class UserInfo < ActiveRecord::Base

  validates :StudentID, uniqueness: true

  belongs_to :role
end
