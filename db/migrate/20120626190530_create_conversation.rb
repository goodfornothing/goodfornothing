class CreateConversation < ActiveRecord::Migration
  def up
    rename_table :library_tags, :conversation_tags
    rename_table :blog_categories, :conversation_categories
  end

  def down
    rename_table :conversation_tags, :library_tags
    rename_table :conversation_categories, :blog_categories
  end
end
