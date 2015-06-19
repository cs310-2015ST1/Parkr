class CreateCrimeData < ActiveRecord::Migration
  def change
    create_table :crime_data do |t|
      t.string :lat
      t.string :lon

      t.timestamps null: false
    end
  end
end

