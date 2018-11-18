class AddNutrientsToFish < ActiveRecord::Migration[5.2]
  def change
    add_column :fish, :nutrients, :jsonb, null: false, default: []
  end
end
