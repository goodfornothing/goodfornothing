class AddNewsToPosts < ActiveRecord::Migration
  def up
    create_table :socials do |t|
      t.string :title
      t.text :description
      t.string :location
      t.timestamp :start_time
      t.timestamp :end_time
      t.references :chapter
      t.timestamps
    end
  end
  
  def down
    drop_table :socials
  end
end
