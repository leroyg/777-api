class Api::PhotosController < ApplicationController

  def index
    render json: Photo.all
  end

  def show
    render json: Photo.find_by(token: params[:id])
  end
end
