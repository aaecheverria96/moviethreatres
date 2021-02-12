class CreateTheatres < ActiveRecord::Migration[5.2]
  def change
    create_table :theatres do |t|
      t.string :name
      t.string :location
      t.time :hours

      t.timestamps null: false
    end
  end
end
