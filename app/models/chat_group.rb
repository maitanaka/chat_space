class ChatGroup < ApplicationRecord

  has_many :chat_groups_users
  has_many :messages
  has_many :users, through: :chat_groups_user

  accepts_nested_attributes_for :chat_groups_users, allow_destroy: true

  validates_presence_of :group_name

end
