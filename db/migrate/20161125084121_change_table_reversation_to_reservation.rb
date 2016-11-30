class ChangeTableReversationToReservation < ActiveRecord::Migration
  def change

    rename_table :table_reservations, :reservation
  end
end
