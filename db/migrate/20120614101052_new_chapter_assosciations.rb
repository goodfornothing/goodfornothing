class NewChapterAssosciations < ActiveRecord::Migration
  def up
    rename_column :gigs, :region_id, :chapter_id
    rename_column :blog_posts, :region_id, :chapter_id
    create_table :friends_gigs do |t|
      t.integer :gig_id
      t.integer :friend_id
    end
    add_column :gigs, :partner_id, :integer
  end

  def down
    rename_column :gigs, :chapter_id, :region_id
    rename_column :blog_posts, :chapter_id, :region_id
    drop_table :friends_gigs
    remove_column :gigs, :partner_id
  end
end
