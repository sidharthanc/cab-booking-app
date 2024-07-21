class CreateCustomerRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_requests do |t|
      t.float :start_latitude
      t.float :start_longitude
      t.float :end_latitude
      t.float :end_longitude
      t.string :status

      t.timestamps
    end
  end
end
