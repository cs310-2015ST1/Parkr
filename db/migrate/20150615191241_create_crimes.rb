class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.string :address

      t.timestamps null: false
    end
  end
end
