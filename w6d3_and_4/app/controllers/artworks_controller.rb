class ArtworksController < ApplicationController
  def index 
    user = User.find(params[:id])
    # if user
    render json: {owned: user.art_works, shared: user.shared_artworks}
    
                  #owned and shared can be abrigry , json nested, 
    # else
      # render json: user.errors.full_messages, status: 422
    # end
  end




end