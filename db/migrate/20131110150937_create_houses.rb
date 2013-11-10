class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :house_name
      t.string :longitude
      t.string :latitude
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
