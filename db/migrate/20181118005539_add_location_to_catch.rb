class AddLocationToCatch < ActiveRecord::Migration[5.2]
  def up
    add_column :catches, :location, :string

    Catch.update_all(location: 'Default')

    change_column_null :catches, :location, false
  end

  def down
    remove_column :catches, :location
  end
end
