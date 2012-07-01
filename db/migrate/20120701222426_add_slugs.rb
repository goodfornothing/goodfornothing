class AddSlugs < ActiveRecord::Migration
  def up
    add_column :chapters, :slug, :string
    add_column :users, :slug, :string
    add_column :conversation_posts, :slug, :string
    add_column :conversation_tags, :slug, :string
    add_column :gigs, :slug, :string
    
    add_index :chapters, :slug, unique: true
    add_index :users, :slug, unique: true
    add_index :conversation_posts, :slug, unique: true
    add_index :conversation_tags, :slug, unique: true
    add_index :gigs, :slug, unique: true    
  end

  def down
    remove_column :chapters, :slug
    remove_column :users, :slug
    remove_column :conversation_posts, :slug
    remove_column :conversation_tags, :slug
    remove_column :gigs, :slug
  
    remove_index :chapters, :slug
    remove_index :users, :slug
    remove_index :conversation_posts, :slug
    remove_index :conversation_tags, :slug
    remove_index :gigs, :slug
  end
end
