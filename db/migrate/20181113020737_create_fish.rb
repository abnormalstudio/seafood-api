class CreateFish < ActiveRecord::Migration[5.2]
  def change
    create_table :fish do |t|
      t.string :species, null: false
      t.float :mercury_mean_ppm
      t.integer :mercury_num_samples

      t.timestamps
    end

    add_index :fish, :species
  end
end
