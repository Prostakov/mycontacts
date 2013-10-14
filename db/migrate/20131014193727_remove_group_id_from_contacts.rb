class RemoveGroupIdFromContacts < ActiveRecord::Migration
  def up
  	remove_column :contacts, :user_id
  end

  def down
  	add_column :contacts, :user_id
  end
end
