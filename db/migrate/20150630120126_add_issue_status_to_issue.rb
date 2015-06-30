class AddIssueStatusToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :issue_status_id, :integer
  end
end
