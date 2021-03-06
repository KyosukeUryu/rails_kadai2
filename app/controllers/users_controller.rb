class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def tops
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '新規登録完了！'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, info: 'ユーザ情報更新完了！'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, warning: '退会しました。ご利用ありがとうございました。'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
