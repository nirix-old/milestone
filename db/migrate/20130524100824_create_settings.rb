class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.text :value
      t.datetime :updated_at
    end
  end
end
