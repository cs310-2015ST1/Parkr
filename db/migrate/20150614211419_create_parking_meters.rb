class CreateParkingMeters < ActiveRecord::Migration
  def change
    create_table :parking_meters do |t|
      t.string :name
      t.string :head_type
      t.string :time_limit
      t.string :rate
      t.string :pay_by_phone
      t.string :in_effect
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
