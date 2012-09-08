class AddSlotToSocials < ActiveRecord::Migration
  def change
    add_column :slots, :social_id, :integer
  end
end
