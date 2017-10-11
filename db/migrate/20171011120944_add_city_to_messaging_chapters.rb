class AddCityToMessagingChapters < ActiveRecord::Migration
  def change
  	add_column :messaging_chapters, :city, :string
  end
end
