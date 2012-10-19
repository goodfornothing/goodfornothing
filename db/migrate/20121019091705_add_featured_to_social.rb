class AddFeaturedToSocial < ActiveRecord::Migration
  def change
		add_column :socials, :featured, :boolean, :default => false
  end
end
