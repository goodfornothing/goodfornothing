class AddVideoToTrill < ActiveRecord::Migration
  def change
		add_column :trills, :vimeo, :string
  end
end
