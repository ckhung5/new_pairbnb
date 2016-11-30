class AddBookToReservations < ActiveRecord::Migration
  def change

    add_column :reservations, :book, :boolean , default: false
  end
end
