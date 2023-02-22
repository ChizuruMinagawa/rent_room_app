class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # imageカラムにアップローダーを紐付け
  mount_uploader :user_image, ImageUploader

  has_many :rooms
  has_many :reservations, dependent: :destroy

  validates :user_name, presence: true
  validates :introduction, length: {maximum: 500}
end
