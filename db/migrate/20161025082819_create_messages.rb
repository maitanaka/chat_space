class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text         :text, null: false
      t.string       :string
      t.references   :chat_group, index: true, null: false
      t.references   :user, index: true, null: false
      t.timestamps   null: false
    end
  end
end
