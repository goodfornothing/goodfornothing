class CreateEventsTable < ActiveRecord::Migration
  def up
 		create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.timestamp :start_time
      t.timestamp :end_time
      t.timestamps
    end
  end

  def down
  	drop_table :events
  end
end
