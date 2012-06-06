class CreatGigUserAssoc < ActiveRecord::Migration
  def up
    create_table :gigs_users do |t|
      t.integer :gig_id
      t.integer :user_id
    end
  end

  def down
    drop_table :gigs_users
  end
end
