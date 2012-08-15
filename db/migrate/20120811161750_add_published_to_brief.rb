class AddPublishedToBrief < ActiveRecord::Migration
  def change
    add_column :briefs, :published, :boolean, :default => false
  end
end