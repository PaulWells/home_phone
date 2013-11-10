class CreateResidencies < ActiveRecord::Migration
  def change
    create_table :residencies do |t|
      t.string :user_id
      t.string :house_id

      t.timestamps
    end
  end
end
