class ChangeTableReversationsToReservations < ActiveRecord::Migration
  def change

    rename_table :reservation, :reservations
  end
end
