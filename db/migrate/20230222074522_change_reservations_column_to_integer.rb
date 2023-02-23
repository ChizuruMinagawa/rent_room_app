class ChangeReservationsColumnToInteger < ActiveRecord::Migration[6.1]
  def up 
    change_column :reservations, :people, :integer, using: "people: :integer"
    change_column :reservations, :user_id, :integer, using: "user_id: :integer"
    change_column :reservations, :room_id, :integer, using: "room_id: :integer"
  end

  def down
    change_column :reservations, :people, :string, using: "people: :string"
    change_column :reservations, :user_id, :string, using: "user_id: :string"
    change_column :reservations, :room_id, :string, using: "room_id: :string"
  end
end
