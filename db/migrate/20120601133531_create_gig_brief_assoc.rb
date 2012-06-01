class CreateGigBriefAssoc < ActiveRecord::Migration
  def up
    add_column :briefs, :gig_id, :integer
  end

  def down
    remove_column :briefs, :gig_id
  end
end
