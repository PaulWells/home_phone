class AddLatitudeLongitudeToHouses < ActiveRecord::Migration
  def up
		add_column :houses, :latitude, :decimal, :precision => 9, :scale => 6
    add_column :houses, :longitude, :decimal, :precision => 9, :scale => 6
  end
	def down
		remove_column :houses, :latitude
    remove_column :houses, :longitude
	end
end
