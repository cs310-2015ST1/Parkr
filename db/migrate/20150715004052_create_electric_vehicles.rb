class CreateElectricVehicles < ActiveRecord::Migration
  def change
    create_table :electric_vehicles do |t|
      t.float :lat
      t.float :lon

      t.timestamps null: false
    end
  end
end
