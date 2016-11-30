class RemovePhotoesFromListings < ActiveRecord::Migration
  def change

     remove_column :listings, :photoes
  end
end
