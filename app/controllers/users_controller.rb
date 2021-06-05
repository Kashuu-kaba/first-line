class UsersController < ApplicationController
before_action :find_params

  def show
    @lines = @user.lines.all
  end

  def edit
    if @user.id == current_user.id
      render :edit
    else
      redirect_to request.referer
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  protected
  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def find_params
    @user = User.find(params[:id])
  end
end
