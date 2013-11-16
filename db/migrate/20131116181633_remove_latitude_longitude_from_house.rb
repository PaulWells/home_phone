class RemoveLatitudeLongitudeFromHouse < ActiveRecord::Migration
  def up
		remove_column :houses, :latitude
    remove_column :houses, :longitude
  end

  def down
		add_column :houses, :latitude, :string
		add_column :houses, :longitude, :string
  end

	
end
