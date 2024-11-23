class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(user_params[:email],user_params[:password])
      redirect_to user_path(@user),success: 'ユーザー登録を完了しました'
    else
      flash.now[:alert] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
