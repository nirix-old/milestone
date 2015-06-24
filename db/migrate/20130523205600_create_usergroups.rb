class CreateUsergroups < ActiveRecord::Migration
  def change
    create_table :usergroups do |t|
      t.string :name
      t.boolean :is_admin, null: false, default: false

      t.timestamps null: false
    end
  end
end
