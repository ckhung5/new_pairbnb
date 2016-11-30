class ChangePhotoesOnListings < ActiveRecord::Migration
  def change

    change_column(:listings, :photoes, "varchar[] USING (string_to_array(photoes, ','))")
  end
end
