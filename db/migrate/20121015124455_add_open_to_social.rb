class AddOpenToSocial < ActiveRecord::Migration
  def change
		add_column :socials, :open, :boolean, :default => false
  end
end
