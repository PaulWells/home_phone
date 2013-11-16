class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :registration_id
      t.integer :user_id

      t.timestamps
    end
  end
end
