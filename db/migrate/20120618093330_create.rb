class Create < ActiveRecord::Migration
  def up
    create_table :bookmarks_gigs do |t|
      t.integer :gig_id
      t.integer :bookmark_id
    end
  end

  def down
    drop_table :bookmarks_gigs
  end
end
