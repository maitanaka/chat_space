class CreateChatGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_groups_users do |t|
      t.integer        :chat_group_id, null: false
      t.integer        :user_id, null: false
    end
  end
end
