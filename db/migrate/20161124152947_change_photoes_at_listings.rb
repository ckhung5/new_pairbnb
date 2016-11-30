class ChangePhotoesAtListings < ActiveRecord::Migration
  def change
    change_column(:listings, :photoes, :string)
  end
end
