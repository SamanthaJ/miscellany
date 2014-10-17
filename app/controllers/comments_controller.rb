class CommentsController < ApplicationController
  include CommentsHelper

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]

    @comment.save

    redirect_to article_path(@comment.article)
  end

  
end