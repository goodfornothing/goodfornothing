class CreateAdviceWiki < ActiveRecord::Migration
  def up
		create_table :advice do |t|
			t.string :title
			t.text :body
			t.timestamps
		end
  end

  def down
		drop_table :advice
  end
end
