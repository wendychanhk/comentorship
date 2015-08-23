class AddSkilltoUser < ActiveRecord::Migration
  def change
  	add_column :users, :skill, :text, array: true, default: []
  end
end
