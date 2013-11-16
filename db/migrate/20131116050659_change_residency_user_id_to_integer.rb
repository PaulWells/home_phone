class ChangeResidencyUserIdToInteger < ActiveRecord::Migration
  def change
		change_column :residencies, :user_id, 'integer USING CAST(user_id AS integer)'
	end
end
