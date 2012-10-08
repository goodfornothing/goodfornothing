class RemoveSlugs < ActiveRecord::Migration
  def up
    remove_column :socials, :slug
    remove_column :warblings, :slug
    remove_column :gigs, :slug
    remove_column :challenges, :slug
  end

  def down
    add_column :socials, :slug, :string
    add_column :warblings, :slug, :string
    add_column :gigs, :slug, :string
    add_column :challenges, :slug, :string
  end
end
