class Room < ApplicationRecord
  # imageカラムにアップローダーを紐付け
  mount_uploader :room_image, ImageUploader

  belongs_to :user

  has_many :reservations
end
