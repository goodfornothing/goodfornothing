class RefactorConversationMoreAgain < ActiveRecord::Migration
  def up
    rename_table :bookmarks_gigs, :bookmarks_challenges
    rename_column :bookmarks_challenges, :gig_id, :challenge_id
  end

  def down
    rename_table :bookmarks_challenges, :bookmarks_gigs
    rename_column :bookmarks_challenges,  :challenge_id, :gig_id
  end
end
