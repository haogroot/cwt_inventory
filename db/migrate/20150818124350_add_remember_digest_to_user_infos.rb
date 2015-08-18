class AddRememberDigestToUserInfos < ActiveRecord::Migration
  def change
    add_column :user_infos, :remember_digest, :string
  end
end
