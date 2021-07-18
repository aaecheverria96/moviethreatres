class RenameTheatreIdInMovietheatres < ActiveRecord::Migration[5.2]
  def change 
    rename_column(:movietheatres, :theatr_id, :theatre_id) 
  end
end
