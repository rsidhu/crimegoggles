class AddLatLonToMap < ActiveRecord::Migration
  def change
  	add_column :maps, :crime, :string
  	add_column :maps, :lat, :float
  	add_column :maps, :lon, :float
  end
end
