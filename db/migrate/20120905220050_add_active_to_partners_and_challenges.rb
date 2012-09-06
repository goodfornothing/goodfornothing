class AddActiveToPartnersAndChallenges < ActiveRecord::Migration
  def change
    add_column :partners, :active, :boolean, :default => false
    add_column :challenges, :active, :boolean, :default => false
    add_column :partners, :type, :string    
  end
end
