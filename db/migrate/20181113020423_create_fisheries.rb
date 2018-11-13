class CreateFisheries < ActiveRecord::Migration[5.2]
  def change
    create_table :fisheries do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :contact, null: false
      t.string :phone, null: false
      t.string :email
      t.string :website

      t.timestamps
    end

    add_index :fisheries, :name
  end
end
