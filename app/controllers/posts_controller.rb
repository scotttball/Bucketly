class PostsController < ApplicationController
  before_action :params_id, only: [:show, :update, :edit, :destroy]

  def index
    @user = User.find(params_id[:id])
    @posts = Posts.where(user_id: @user)
  end

  def show
  end

  def new
    @post = Post.new(user_id: params_id[:user_id])
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post Succesfully Updated'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Post Succesfully Deleted'
    else
      redirect_to post_path(@post)
    end
  end


  private

  def post_params
    Post.require(:post).permit(:title, :description, :body, :user_id)
  end

  def params_id
    @post = Post.find(params_id[:id])
  end

end
