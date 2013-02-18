class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.boolean :is_admin, null: false, default: false
    end
  end
end
