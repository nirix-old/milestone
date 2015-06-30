class AddIssueTypeToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :issue_type_id, :integer
  end
end
