class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :people, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50}

  validate :start_date_check #開始日が今日以降になるよう設定(もしcontrollerのバリデーションをすり抜けた場合用)
  def start_date_check
    if self.start_date <= Date.yesterday
      errors.add(:start_date, "は今日以降の日付にしてください。")
    end
  end

  validate :end_date_check #終了日が開始日以降になるよう設定(もしcontrollerのバリデーションをすり抜けた場合用)
  def end_date_check
    return unless start_date && end_date
    if self.start_date > self.end_date
      errors.add(:end_date, "はチェックインより前の日付は登録できません。")
    end
  end
end
