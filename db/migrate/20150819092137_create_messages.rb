class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

    	t.references :sender, references: :users
    	t.references :receiver, references: :users
    
		t.text :text_message
        t.timestamps null: false
    end
  end
end


