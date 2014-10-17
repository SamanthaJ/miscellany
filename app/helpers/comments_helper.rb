module CommentsHelper
  def comment_params
    params.require(:comment).permit(:post_name, :body)
  end
end
