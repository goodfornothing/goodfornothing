class AddEndTimeToSocial < ActiveRecord::Migration
  def change
		add_column :socials, :end_time, :timestamp
  end
end
