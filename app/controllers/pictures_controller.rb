class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]
  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
