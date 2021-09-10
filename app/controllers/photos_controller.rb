class PhotosController < ApplicationController

  def create
    photo = @current_user.photos.create!(photo_params)
    render json: photo, status: :create
  end

  private

  def photo_params
    params.permit(:title, :description, :url)
  end
end
