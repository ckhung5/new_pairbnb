class AddPhotoesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :photoes, :json
  end
end
