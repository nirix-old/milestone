class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name, null: false
      t.text :value
      t.string :setting_type, null: false, default: 'text'
      t.text :possible_values
    end
  end
end
