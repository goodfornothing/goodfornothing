class CategorySlug < ActiveRecord::Migration
  def up
    add_column :conversation_categories, :slug, :string
    add_index :conversation_categories, :slug, unique: true
  end

  def down
    remove_column :conversation_categories, :slug
    remove_index :conversation_categories, :slug
  end
end