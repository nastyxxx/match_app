class UsersController < ApplicationController
  before_action :card_confirmation, only: %i[edit show]

  def index
    @users = User.where.not(id: current_user.id)
  end

  def edit
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)

    customer = Payjp::Customer.retrieve(card.customer_token)
    @cards = customer.cards
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:image, :nickname, :email, :address)
  end

  def card_confirmation
    redirect_to new_card_path and return unless current_user.card.present?
  end
end
