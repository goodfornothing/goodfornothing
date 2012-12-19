class AddNotifiedToTrills < ActiveRecord::Migration
  def change
		remove_column :trills, :vimeo
		add_column :trills, :notified, :boolean, :default => false
  end
end
