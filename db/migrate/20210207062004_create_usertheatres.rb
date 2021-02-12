class CreateUsertheatres < ActiveRecord::Migration[5.2]
  def change
    create_table :usertheatres do |t|
      
      t.belongs_to :user
      
      t.belongs_to :theatre 
    

      t.timestamps null: false
    end
  end
end
