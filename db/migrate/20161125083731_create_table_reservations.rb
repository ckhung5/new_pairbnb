class CreateTableReservations < ActiveRecord::Migration
  def change
    create_table :table_reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.timestamps null: false
    end
  end
end
