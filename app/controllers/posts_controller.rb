class PostsController < ApplicationController
  include PostsHelper
  
  before_action :set_post, except: [:index, :new, :create,]
  before_action :authenticate_user!, except: [:index, :show]
 
 
  def index
   @posts = Post.all
   @post = Post.new
  end

  
  def show
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
    @post.destroy

    flash.notice = "'#{@post.title}' has been Deleted!"

    redirect_to posts_path
  end

  
  def edit
  end

  
  def update
    @post.update(post_params)

    flash.notice = "'#{@post.title}' has been Updated!"

    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:author, :title, :body)
  end


end



