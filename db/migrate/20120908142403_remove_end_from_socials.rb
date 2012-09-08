class RemoveEndFromSocials < ActiveRecord::Migration
  def change
    remove_column :socials, :end_time
  end
end
