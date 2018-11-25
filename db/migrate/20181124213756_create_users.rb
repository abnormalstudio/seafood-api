class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :name, null: false
      t.boolean :admin, null: false, default: false
      t.integer :fishery_id

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :fishery_id
  end
end
