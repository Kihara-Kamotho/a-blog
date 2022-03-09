class PostsController < ApplicationController
  def index
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
  
  private
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
