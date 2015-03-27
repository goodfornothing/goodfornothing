class AddColumnsToMessagingChallenges < ActiveRecord::Migration
  def up
    add_column :messaging_challenges, :organisation, :string
    add_column :messaging_challenges, :what_they_want, :string, :limit => 300
    add_column :messaging_challenges, :what_song, :string
    add_column :messaging_challenges, :where_heard, :string
  end

  def down
    remove_column :messaging_challenges, :organisation
    remove_column :messaging_challenges, :what_they_want
    remove_column :messaging_challenges, :what_song
    remove_column :messaging_challenges, :where_heard
  end
end
