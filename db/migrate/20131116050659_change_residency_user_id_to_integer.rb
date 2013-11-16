class ChangeResidencyUserIdToInteger < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :residencies do |t|
        dir.up   { t.change :user_id, :integer }
        dir.down { t.change :user_id, :string }
      end
    end
  end
end
