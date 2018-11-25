class AddVesselToCatch < ActiveRecord::Migration[5.2]
  def change
    add_column :catches, :vessel, :string
    add_column :catches, :preservation_method, :string
  end
end
