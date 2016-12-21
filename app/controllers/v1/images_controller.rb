module V1
  class ImagesController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index]

    def index
      image_urls = ArtObject.pluck(:image_url)
      render json: image_urls
    end
  end
end
