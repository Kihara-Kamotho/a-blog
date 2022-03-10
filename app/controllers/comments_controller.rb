class CommentsController < ApplicationController
  before_action :set_post

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_comment_path(@post, @comment)
      flash.now[:notice] = "Comment created successfully"
    else
      render :new
      flash.now[:alert] = "Comment not created"
    end
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
