class Group < ActiveRecord::Base
  attr_accessible :name, :user_id
  belongs_to :user
  has_many :contacts

  validates :name, length: 2..20
end
