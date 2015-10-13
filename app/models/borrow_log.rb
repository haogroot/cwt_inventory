class BorrowLog < ActiveRecord::Base
  belongs_to :user_info
  belongs_to :item
end
