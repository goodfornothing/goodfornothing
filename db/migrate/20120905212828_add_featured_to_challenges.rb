class AddFeaturedToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :featured, :boolean, :default => false
  end
end
