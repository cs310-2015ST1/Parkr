class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :location
      t.string :distance
      t.string :rate

      t.timestamps null: false
    end
  end
end
