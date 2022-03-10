class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, flash: { notice: "Post created successfully"}
    else
      render :new
      flash.now[:alert] = "Post not created"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
      flash.now[:notice] = "Post created successfully"
    else
      render :edit
      flash.now[:alert] = "Post not updated"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
      flash.now[:alert] = "Post has been deleted"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
