class HomeController < ApplicationController
  def top
    @q = Room.ransack(params[:q])
  end
end
