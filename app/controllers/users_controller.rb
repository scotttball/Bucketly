class UsersController < ApplicationController
  before_action :params_id, only: [:show, :update, :edit, :destroy]
  
  def index
    # @user = User.find(params[:user_id])
    @users = User.all 
    @posts = Post.all
  end

  def show
    @posts = @user.posts
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path
    else
      redirect_to user_path(@user)
    end
  end

  private

  def params_id
    User.require(:user).permit(:first_name, :last_name, :display_name, :bio, :location, :email, :user_id)
  end

  def user_params
    @user = User.find(params[:id])
  end
end

