class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms.order(created_at: :desc)
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  def search
    @rooms = SearchRoomsService.search(params[:keyword]).order(created_at: :desc)
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
