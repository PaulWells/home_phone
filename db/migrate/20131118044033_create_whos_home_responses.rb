class CreateWhosHomeResponses < ActiveRecord::Migration
  def change
    create_table :whos_home_responses do |t|
      t.integer :whos_home_request_id
      t.integer :user_id
      t.boolean :is_home

      t.timestamps
    end
  end
end
