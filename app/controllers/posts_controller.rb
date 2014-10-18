class PostsController < ApplicationController
  include PostsHelper
  
  before_action :authenticate_user!, except: [:index, :show]
 
 
  def index
   @posts = Post.all
   @post = Post.new
  end

  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  
  def new
     @post = Post.new
  end

  
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    flash.notice = "'#{@post.title}' has been Deleted!"

    redirect_to posts_path
  end

  
  def edit
    @post = Post.find(params[:id])
  end

  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    flash.notice = "'#{@post.title}' has been Updated!"

    redirect_to post_path(@post)
  end

end



