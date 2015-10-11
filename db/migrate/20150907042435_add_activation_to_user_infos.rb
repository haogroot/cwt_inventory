class AddActivationToUserInfos < ActiveRecord::Migration
  def change
    add_column :user_infos, :activation_digest, :string
    add_column :user_infos, :activated, :boolean, default: false
    add_column :user_infos, :activated_at, :datetime
  end
end
