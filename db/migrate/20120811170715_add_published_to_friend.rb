class AddPublishedToFriend < ActiveRecord::Migration
  def change
    add_column :friends, :published, :boolean, :default => false
    #published_at
  end
end