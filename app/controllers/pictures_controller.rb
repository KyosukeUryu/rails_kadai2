class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]
  def index
    @pictures = Picture.all.order(id: :desc)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if params[:back]
      render 'new'
    else
      if @picture.save
        redirect_to pictures_path, success: '投稿しました！'
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
    if @picture.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to picture_path(@picture.id), info: '投稿内容を編集しました！'
    else
      render :new
    end
  end

  def destroy
    @picture.destroy
    redirect_to user_path(current_user.id), danger: '投稿を削除しました！'
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
