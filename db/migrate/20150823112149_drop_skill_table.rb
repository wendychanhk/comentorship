class DropSkillTable < ActiveRecord::Migration
  def change

  	drop_table :users_have_skills

  	drop_table :skills

  end
end
