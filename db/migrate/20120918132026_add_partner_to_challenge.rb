class AddPartnerToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :partner_id, :integer
    add_column :slots, :custom_skill, :string
  end
end
