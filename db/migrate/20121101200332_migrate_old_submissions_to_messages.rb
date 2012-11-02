class MigrateOldSubmissionsToMessages < ActiveRecord::Migration
  
	def up
	
		create_table :forms do |t|
			t.string :title
		end
	
		create_table :questions do |t|
			t.integer :form_id
			t.string :title
		end
		
		create_table :answers do |t|
			t.integer :question_id
			t.integer :message_id
			t.text :content 
		end
		
		remove_column :messages, :type
		add_column :messages, :form_id, :integer
		
  end

	def down
		
		drop_table :forms
		drop_table :questions
		drop_table :answers
		
		remove_column :messages, :form_id
		add_column :messages, :type, :string
		
	end

end
