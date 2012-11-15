class CreateMessagingChapter < ActiveRecord::Migration
  def up
		create_table :messaging_chapters do |t|
			t.text :why_city
			t.text :why_start
			t.text :why_you
			t.timestamps
		end
  end

  def down
		drop_table :messaging_chapters
  end
end
