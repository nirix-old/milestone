class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.integer :project_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
