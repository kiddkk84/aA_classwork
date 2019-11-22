class ArtworkSharesController < ApplicationController
  def share
      artwork_share = ArtworkShare.create(artwork_share_params)
    if artwork_share.save
      redirect_to "/artwork_shares/#{artwork_share.id}"
    else
      render json: artwork_share.errors.full_messages, status: 422
    end

  end 

  def unshare 

    share = ArtworkShare.find(params[:id])
    # if share 
        share.destroy
        render json: share 
    # else 
    #   render json: artwork_share.errors.full_messages, status: 422
    # end 
  end 

  def show 
    share = ArtworkShare.find(params[:id])

    render json: share 
  end 



  private

  def artwork_share_params
    params.require(:share).permit(:viewer_id, :artwork_id)
  end

end 