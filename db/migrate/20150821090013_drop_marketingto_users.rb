class DropMarketingtoUsers < ActiveRecord::Migration
  def change

  	
   remove_column :users, :have_marketing, :boolean
 
  end
end
