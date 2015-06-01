class RenameTableCon < ActiveRecord::Migration

    def change
      rename_table :conversations, :mailboxer_conversations
    end
  end
