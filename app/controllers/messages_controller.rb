# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :user_validation

  def index
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end

  def create
    @message = @room.messages.new(message_params)
    ActionCable.server.broadcast 'message_channel', message: @message if @message.save
    redirect_to room_messages_path(@room) if @message.image.attached?
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def user_validation
    redirect_to new_card_path and return unless current_user.card.present?

    @room = Room.find(params[:room_id])
    room = @room.room_users.where(user_id: current_user.id)
    redirect_to root_path unless room.exists?
  end
end
