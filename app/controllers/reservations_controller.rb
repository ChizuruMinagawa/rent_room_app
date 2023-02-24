class ReservationsController < ApplicationController

  def index
    @user = User.find_by(id: params[:id])
    @reservations = Reservation.where(user_id: current_user.id).includes(:user)
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to "/reservations/index"
    else
      render "confirm"
    end
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.start_date < Date.yesterday #今日以降の日付にすること
      redirect_to "/rooms/#{@reservation.room_id}"
      flash[:notice] = "予約日は今日以降の日付を入力してください"
    elsif @reservation.end_date < @reservation.start_date #終了日を開始日より後の日付にすること
      redirect_to "/rooms/#{@reservation.room_id}"
      flash[:notice] = "チェックアウトはチェックインより後の日付を入力してください"
    end
  end
   
  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :people).merge(user_id: current_user.id)
  end

end

