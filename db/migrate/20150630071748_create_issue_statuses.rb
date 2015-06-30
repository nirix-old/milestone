class CreateIssueStatuses < ActiveRecord::Migration
  def change
    create_table :issue_statuses do |t|
      t.string :name
      t.boolean :is_closed

      t.timestamps null: false
    end
  end
end
