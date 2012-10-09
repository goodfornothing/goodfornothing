class IssuesUsersAssoc < ActiveRecord::Migration
  def change
    rename_table :users_issues, :issues_users
  end
end
