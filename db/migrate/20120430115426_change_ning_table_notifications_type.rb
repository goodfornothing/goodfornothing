class ChangeNingTableNotificationsType < ActiveRecord::Migration
  def up
  	change_column :ning, :notification_broadcasts, :boolean, :default => false
  	change_column :ning, :notification_email, :boolean, :default => false
  end

  def down
  	change_column :ning, :notification_broadcasts, :string
  	change_column :ning, :notification_email, :string
  end
end
