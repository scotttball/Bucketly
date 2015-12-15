class PostsController < ApplicationController
  before_action :params_id, only: [:show, :update, :edit, :destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.order updated_at: :desc
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new(user_id: params[:user_id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post.update(user_id: params[:user_id])
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post Succesfully Updated'
      redirect_to user_post_path(@post.user_id, @post)
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
    params.require(:post).permit(:title, :description, :body, :user_id, :completed, :picture, :user_id)
  end

  def params_id
    @post = Post.find(params[:id])
  end

end
