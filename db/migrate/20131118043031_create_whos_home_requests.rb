class CreateWhosHomeRequests < ActiveRecord::Migration
  def change
    create_table :whos_home_requests do |t|
      t.integer :user_id
      t.integer :num_recipients

      t.timestamps
    end
  end
end
