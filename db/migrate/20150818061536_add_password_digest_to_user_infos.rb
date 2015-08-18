class AddPasswordDigestToUserInfos < ActiveRecord::Migration
  def change
    add_column :user_infos, :password_digest, :string
  end
end
