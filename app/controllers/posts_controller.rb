class PostsController < ApplicationController

  before_action :is_current_user_author?, only: [:edit, :update], message: "You are not authorized to edit this post"

  def show
    @post = Post.find(params[:id])
    if @post
      render :show
    else
      flash.now[:errors] = "Post not found"
      redirect_to subs_url
    end
  end

  def new
    @post = Post.new
    render :new
  end


  def create
    @post = Post.new(post_params)
    @post.moderator = current_user
    if @post.save
      redirect_to post_url(@post.id)
    else
      flash.now[:errors] = "Invalid input"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to post_url(@post.id)
    else
      flash.now[:errors] = "Invalid input"
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def is_current_user_author?
    @post = Post.find(params[:id])
    current_user.id == @post.author_id
  end

end
