class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone_number
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
