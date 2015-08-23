class DropTableSkill < ActiveRecord::Migration
  def change

  drop_table :skills
  drop_table :skills_users
  drop_table :users_wanteds
  drop_table :wanteds


  end
end
