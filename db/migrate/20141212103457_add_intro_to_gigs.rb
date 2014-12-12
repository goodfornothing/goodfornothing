class AddIntroToGigs < ActiveRecord::Migration
  def up
    add_column :gigs, :intro, :text
  end

  def down
    remove_column :gigs, :intro
  end
end
