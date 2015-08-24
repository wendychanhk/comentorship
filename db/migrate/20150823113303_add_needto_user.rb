class AddNeedtoUser < ActiveRecord::Migration
  def change
  	add_column :users, :need, :text, array: true, default: []
  end
end
