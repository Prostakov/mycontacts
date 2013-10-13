class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :group_id, :last_name, :middle_name, :phone, :user_id
  belongs_to :user

  validates :first_name, length: 2..20
  validates :middle_name, length: 2..20
  validates :last_name, length: 2..20
end
