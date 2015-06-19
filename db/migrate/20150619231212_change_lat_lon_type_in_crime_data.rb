class ChangeLatLonTypeInCrimeData < ActiveRecord::Migration
  def change
      change_column :crime_data, :lat, :string
      change_column :crime_data, :lon, :string
  end
end
