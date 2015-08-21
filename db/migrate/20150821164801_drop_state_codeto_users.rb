class DropStateCodetoUsers < ActiveRecord::Migration
  def change

  
  	remove_column :users, :state_code
  	add_column :users, :city, :string
 

  end
end
