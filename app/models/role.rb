class Role < ActiveRecord::Base
  has_many :user_infos
end
