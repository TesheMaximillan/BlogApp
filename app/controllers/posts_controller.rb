class PostsController < ApplicationController
  def index
    @posts = Post.all.order(author_id: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
