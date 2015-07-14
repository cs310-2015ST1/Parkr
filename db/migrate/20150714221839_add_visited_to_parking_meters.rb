class AddVisitedToParkingMeters < ActiveRecord::Migration
  def change
    add_column :parking_meters, :visited, :integer
  end
end
