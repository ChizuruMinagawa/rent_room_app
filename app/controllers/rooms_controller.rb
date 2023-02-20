class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def own
    @user = User.find_by(id: params[:id])
    @rooms = Room.where(user_id: current_user.id).includes(:user)
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_detail, :price, :address, :room_image))
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "施設の新規登録をしました"
      redirect_to "/rooms/own"
    else
      flash.now[:notice] = "施設の新規登録に失敗しました"
      render "new"
   end
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:room_name, :room_detail, :price, :address, :room_image))
      redirect_to "/rooms/own"
    else
      render "edit"
    end
  end

  def destroy
  end

  private
  
  def room_params
    params.require(:room).permit(:room_name, :room_detail, :price, :address, :room_image)
  end

end
