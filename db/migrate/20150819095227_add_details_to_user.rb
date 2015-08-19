class AddDetailsToUser < ActiveRecord::Migration
  def change

  add_column :users, :first_name, :string
  add_column :users, :last_name, :string
  add_column :users, :city, :string
  add_column :users, :country, :string
  add_column :users, :company, :string
  add_column :users, :position, :string
  add_column :users, :picture_url, :string
  add_column :users, :intro, :text

  end
end
