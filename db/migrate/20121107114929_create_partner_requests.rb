class CreatePartnerRequests < ActiveRecord::Migration
  def up
		create_table :messaging_partners do |t|
			t.string :name
			t.string :contact
			t.string :purpose
			t.text :notes
			t.timestamps
		end
  end

  def down
		drop_table :messaging_partners
  end
end
