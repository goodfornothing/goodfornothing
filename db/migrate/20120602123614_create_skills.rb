class CreateSkills < ActiveRecord::Migration
  def up
    create_table :skills do |t|
      t.string :title
    end
  end

  def down
    drop_table :skills
    
  end
end
