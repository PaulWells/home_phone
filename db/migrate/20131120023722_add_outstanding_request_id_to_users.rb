class AddOutstandingRequestIdToUsers < ActiveRecord::Migration
  def change
		add_column :users, :outstanding_request_id, :integer
  end
end
