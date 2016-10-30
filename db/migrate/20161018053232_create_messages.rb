class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text         :text
      t.string       :image
      t.references   :chat_group, index: true
      t.references   :user, index: true
      t.timestamps   null: false
    end
  end
end
