class CommentsController < ApplicationController
  include CommentsHelper
  before_action :authenticate_user!, only: [:create]
  

  def create
    post = Post.find(params[:post_id ])
    comment = post.comments.create(comment_params)
    

    redirect_to post_path(comment.post)
  end

  private
   def comment_params
    params.require(:comment).permit(:user_name, :body)
  end
end

  
