class CreateCabs < ActiveRecord::Migration[6.1]
  def change
    create_table :cabs do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :availability
      t.string :cab_type

      t.timestamps
    end
  end
end
