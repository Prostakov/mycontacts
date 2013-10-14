class AddUserIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :user_id, :integer, default: 0
  end
end
