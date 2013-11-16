class ChangeResidencyHouseIdToInteger < ActiveRecord::Migration
	def change
		change_column :residencies, :house_id, 'integer USING CAST(house_id AS integer)'
	end
end
