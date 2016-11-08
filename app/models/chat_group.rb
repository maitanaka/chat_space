class ChatGroup < ApplicationRecord
  has_many :users, through: :chat_groups_user
  has_many :chat_groups_users
  accepts_nested_attributes_for :chat_groups_users, allow_destroy: true
  has_many :messages
  validates_presence_of :group_name
end
