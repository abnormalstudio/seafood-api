class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :catch_id, null: false
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.text :issue, null: false

      t.timestamps
    end

    add_index :reports, :catch_id
  end
end
