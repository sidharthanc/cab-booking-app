class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.references :cab, null: false, foreign_key: true
      t.references :customer_request, null: false, foreign_key: true
      t.float :start_latitude
      t.float :start_longitude
      t.float :end_latitude
      t.float :end_longitude
      t.float :fare

      t.timestamps
    end
  end
end
