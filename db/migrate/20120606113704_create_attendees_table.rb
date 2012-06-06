class CreateAttendeesTable < ActiveRecord::Migration
  def up
    drop_table :gigs_users
    create_table :slots_users do |t|
      t.integer :slot_id
      t.integer :user_id
    end
  end

  def down
    drop_table :slots_users
    create_table :gigs_users do |t|
      t.integer :gig_id
      t.integer :user_id
    end
  end
end
