class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.text :info

      t.timestamps
    end
  end
end
