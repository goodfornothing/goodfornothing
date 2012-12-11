class AddStuffToChapter < ActiveRecord::Migration
  def change
		add_column :chapters, :twitter_handle, :string
		add_column :chapters, :twitter_password, :string
		add_column :chapters, :shaken_hands, :boolean, :default => false
  end
end
