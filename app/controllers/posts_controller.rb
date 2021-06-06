class PostsController < ApplicationController

  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Successfully created'
    else
      render :new, danger: 'Failed to create post'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, info: 'Post have been updated'
    else
      render :edit, danger: 'Failed to update post'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Successfully deleted'
  end

  private

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end