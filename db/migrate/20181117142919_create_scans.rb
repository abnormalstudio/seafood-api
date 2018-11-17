class CreateScans < ActiveRecord::Migration[5.2]
  def change
    create_table :scans do |t|
      t.integer :catch_id, null: false
      t.string :scanner, null: false
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.timestamp :scanned_at, null: false

      t.timestamps
    end

    add_index :scans, :catch_id
  end
end
