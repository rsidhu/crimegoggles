class AddLatLonToMap < ActiveRecord::Migration
  def change
  	add_column :maps, :crime, :string
  	add_column :maps, :lat, :decimal, precision: 9, scale: 6
  	add_column :maps, :lon, :decimal, precision: 9, scale: 6
  end
end
