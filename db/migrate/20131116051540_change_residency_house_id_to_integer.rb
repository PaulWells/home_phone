class ChangeResidencyHouseIdToInteger < ActiveRecord::Migration
   def change
    reversible do |dir|
      change_table :residencies do |t|
        dir.up   { t.change :house_id, :integer }
        dir.down { t.change :house_id, :string }
      end
    end
  end
end
