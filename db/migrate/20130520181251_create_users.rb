class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :email
      t.integer :group_id, null: false, default: 2

      t.timestamps
    end
  end
end
