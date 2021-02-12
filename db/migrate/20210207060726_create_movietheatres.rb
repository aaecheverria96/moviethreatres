class CreateMovietheatres < ActiveRecord::Migration[5.2]
  def change
    create_table :movietheatres do |t|
      t.integer :movie_id
      t.integer :theatr_id

      t.timestamps null: false
    end
  end
end
