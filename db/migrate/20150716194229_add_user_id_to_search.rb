class AddUserIdToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :user_id, :string
  end
end
