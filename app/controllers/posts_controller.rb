class PostsController < ApplicationController
  include PostsHelper
  
  before_action :authenticate_user!
 
  def index
   @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save

    flash.notice = "'#{post.title}' hsa been Created!"

    redirect_to post_path(@post)
  end 


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    flash.notice = "'#{@post.title}' has been Deleted!"

    redirect_to action: 'index'
  end

  
  def edit
    @post = Post.find(params[:id])
  end

  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    flash.notice = "'#{@post.title}' has been Updated!"

    redirect_to article_path(@post)
  end



  

end



