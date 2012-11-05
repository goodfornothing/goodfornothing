class AddChallengeSubmission < ActiveRecord::Migration
  def up
		create_table :challenge_submissions do |t|
			t.string :name
			t.string :contact
			t.text :description
			t.timestamps
		end
  end

  def down
		drop_table :challenge_submissions
  end
end
