class AddAcceptedChatTosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :accepted_chat_tos, :boolean
  end
end
