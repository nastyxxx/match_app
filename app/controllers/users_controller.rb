class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
  end

  def edit
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
end
