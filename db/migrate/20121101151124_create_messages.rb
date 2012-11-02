class CreateMessages < ActiveRecord::Migration
  def up
	
		create_table :messages do |t|
			t.references :user
			t.string :type
			t.text :body
			t.timestamps
		end
		
		create_table :recipients do |t|
			t.integer :message_id
			t.integer :user_id
		end
		
  end

	def down
		
		drop_table :messages
		drop_table :recipients
		
	end
end
