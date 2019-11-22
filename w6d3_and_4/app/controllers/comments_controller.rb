class CommentsController < ApplicationController

    def create
      comment = Comment.create(comment_params)
      if comment.save 
        render json: comment
      else 

        render json: comment.errors.full_messages, status:422
      end 
    end 

    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
      render json: comment 

    end 

    def index
      render json: Comment.all
    end 


  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end 