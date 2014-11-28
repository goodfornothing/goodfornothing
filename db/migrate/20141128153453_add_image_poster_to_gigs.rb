class AddImagePosterToGigs < ActiveRecord::Migration
  def up
    add_column :gigs, :image, :string
    add_column :gigs, :poster, :string 
  end

  def down
    remove_column :gigs, :image
    remove_column :gigs, :poster
  end
end
