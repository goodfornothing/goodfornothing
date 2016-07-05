class AddMailchimpIdKeyToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :mailchimp_api_key, :string
    add_column :chapters, :mailchimp_list_id, :string
  end
end
