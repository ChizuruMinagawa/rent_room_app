class Room < ApplicationRecord
  # imageカラムにアップローダーを紐付け
  mount_uploader :room_image, ImageUploader

  belongs_to :user
  has_many :reservations

  validates :room_name, presence: true
  validates :price, presence: true, numericality: true
  validates :address, presence: true
  validates :room_detail, presence: true, length: {maximum: 500}

  validate :date_check, on: :show #終了日が開始日以降になるよう設定
  def date_check
    return unless start_date && end_date
    if self.start_date > self.end_date
      errors.add(:end_date, "は開始日より前の日付は登録できません。")
    end
  end

  validate :start_date_check, on: :show #開始日が今日以降になるよう設定
  def start_date_check
    if self.start_date <= Date.yesterday
      errors.add(:start_date, "は今日以降の日付にしてください。")
    end
  end
end
