class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :chat_groups_users
  has_many :chat_groups, through: :chat_groups_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :email
end
