class PostsController < ApplicationController
  before_action :fetch_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at desc")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy

    redirect_to action: "index"
  end

  private

  def post_params
    params[:post].permit(:title, :content)
  end

  def fetch_post
    @post = Post.find(params[:id])
  end
end
