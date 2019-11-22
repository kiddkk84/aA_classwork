class UsersController < ApplicationController
  def index
    if params[:query].nil?
      render json: User.all
    else
      render json: User.find_by({username: params[:query]})
    end
  
  end 

 
  def show
    user = User.find(params[:id])
    # find_by => specify the colum, User.find rails magic
    render json: user
  end 

  def create
    user = User.new(user_params)

      if user.save
        render json: user
      else
        render json: user.errors.full_messages, status: 422
      end

  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to "/users/#{user.id}"
    else
      render json: user.errors.full_messages, status: 422
    end

  end
 
    def destroy 
    user = User.find(params[:id])

    user.destroy

    render json: user
    end 


    def artworks
      

    end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

  


end


