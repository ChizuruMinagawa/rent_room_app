class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :people
      t.string :user_id
      t.string :room_id

      t.timestamps
    end
  end
end
