class CreateRegions < ActiveRecord::Migration
  def up
  	create_table :regions do |t|
      t.string :title
      t.timestamps
    end
    add_column :blog_posts, :region_id, :integer
    add_column :events, :region_id, :integer
  end

  def down
  	drop_table :regions
    add_column :blog_posts, :region_id
    add_column :events, :region_id
  end
end
