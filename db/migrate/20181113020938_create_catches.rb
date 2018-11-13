class CreateCatches < ActiveRecord::Migration[5.2]
  def change
    create_table :catches do |t|
      t.integer :fish_id, null: false
      t.integer :fishery_id, null: false
      t.date :caught_on, null: false
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.string :code, null: false

      t.timestamps
    end

    add_index :catches, :code, unique: true
    add_index :catches, :fish_id
    add_index :catches, :fishery_id
    add_index :catches, [:latitude, :longitude]
  end
end
