class CreateUserAndWanted < ActiveRecord::Migration
  def change
    create_table :users_wanteds id: false do |t|
    	t.belongs_to :wanted, index: true 
    	t.belongs_to :user, index: true
    end
  end
end
