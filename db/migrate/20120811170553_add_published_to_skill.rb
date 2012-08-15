class AddPublishedToSkill < ActiveRecord::Migration
  def change
    add_column :skills, :published, :boolean, :default => false
    #published_at
  end
end