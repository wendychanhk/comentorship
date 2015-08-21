class AddColumnToUser < ActiveRecord::Migration
  def change

  	add_column :users, :have_marketing, :boolean, :default => false

  end
end
