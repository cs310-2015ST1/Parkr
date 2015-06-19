class CreateCrimeData < ActiveRecord::Migration
  def change
    create_table :crime_data do |t|
      t.float :lat
      t.float :lon

      t.timestamps null: false
    end
  end
end
