class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]
  def index
    @pictures = Picture.all.order(id: :desc)
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to user_path(current_user.id), notice: '投稿しました！'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to user_path(current_user.id), notice: '投稿内容を編集しました！'
    else
      render :new
    end
  end

  def destroy
    @picture.destroy
    redirect_to user_path(current_user.id), notice: '投稿を削除しました！'
  end

  def confirm
    @picture = Picture.new(picture_params)
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
