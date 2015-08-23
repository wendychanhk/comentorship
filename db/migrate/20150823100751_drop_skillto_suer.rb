class DropSkilltoSuer < ActiveRecord::Migration
  def change
  	remove_column :users, :skill
  end
end
