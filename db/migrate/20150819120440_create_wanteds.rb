class CreateWanteds < ActiveRecord::Migration
  def change
    create_table :wanteds do |t|
      t.string :name 
      t.timestamps null: false
    end
  end
end

