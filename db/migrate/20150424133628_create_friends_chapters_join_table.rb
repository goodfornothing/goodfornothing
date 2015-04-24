class CreateFriendsChaptersJoinTable < ActiveRecord::Migration
  def up
    create_table :chapters_friends, :id => false do |t|
      t.integer :chapter_id
      t.integer :friend_id
    end
    add_index :chapters_friends, [:chapter_id, :friend_id]
  end

  def down
    drop_table :chapters_friends
  end
end
