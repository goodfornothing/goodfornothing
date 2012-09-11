class CreateIdeas < ActiveRecord::Migration
  def up
    create_table :ideas do |t|
      t.text :body
      t.references :user
      t.references :challenge
      t.timestamps
    end
  end

  def down
    drop_table :ideas
  end
end
