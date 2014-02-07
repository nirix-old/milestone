class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :summary
      t.text :description
      t.integer :user_id
      t.integer :project_id
      t.integer :status_id
      t.boolean :is_closed
      t.integer :type_id
      t.integer :version_id

      t.timestamps
    end
  end
end
