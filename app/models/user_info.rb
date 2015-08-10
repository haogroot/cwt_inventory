class UserInfo < ActiveRecord::Base

  validates :StudentID, uniqueness: true
end
