class AddCityAndCountrytoUser < ActiveRecord::Migration
  def change

  	remove_column :users, :city
  	remove_column :users, :country
  	add_column :users, :country_code, :string
  	add_column :users, :state_code, :string

  end
end
