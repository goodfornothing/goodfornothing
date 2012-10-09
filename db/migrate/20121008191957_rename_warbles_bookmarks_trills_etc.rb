class RenameWarblesBookmarksTrillsEtc < ActiveRecord::Migration
  def change
    rename_table :bookmarks, :trills
    rename_table :bookmarks_challenges, :trills_challenges
    rename_table :bookmarks_warblings, :trills_issues
    
    rename_column :trills_challenges, :bookmark_id, :trill_id
    rename_column :trills_issues, :bookmark_id, :trill_id
    rename_column :trills_issues, :warbling_id, :issue_id
    
    rename_table :warblings, :issues
    rename_table :challenges_warblings, :challenges_issues
    rename_table :users_warblings, :users_issues
    
    rename_column :challenges_issues, :warbling_id, :issue_id
    rename_column :posts, :warbling_id, :issue_id
    rename_column :users_issues, :warbling_id, :issue_id
    
    drop_table :bookmarks_tags
    drop_table :tags
  end

end
