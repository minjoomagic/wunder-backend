class ChangeMessagesContentToText < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :content, :text
  end
end
