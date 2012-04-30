class CreateNingTable < ActiveRecord::Migration
  def up
 		create_table :ning do |t|
 			t.references :user
      t.string :name
      t.string :email
      t.string :gender
      t.string :location
      t.string :country
      t.string :zip
      t.string :age
      t.string :website
      t.string :twitter
      t.date :birthdate
      t.text :reasons_for_joining
      t.text :skills
 			t.string :notification_broadcasts
 			t.string :notification_email
 			t.date :date_joined
      t.date :last_visit
      t.timestamps
    end
  end

  def down
  	drop_table :ning
  end
end
