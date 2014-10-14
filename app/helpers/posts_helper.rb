module PostsHelper
  def post_params
    params.require(:post).permit(:author, :title, :body)
  end
end
