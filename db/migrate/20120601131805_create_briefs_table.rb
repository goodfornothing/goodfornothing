class CreateBriefsTable < ActiveRecord::Migration
  def up
    create_table :briefs do |t|
  		t.string :title
  		t.text :description
  	end
  	rename_table :events, :gigs
  end

  def down
    drop_table :briefs
    rename_table :gigs, :events
  end
end
