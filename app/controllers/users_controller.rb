class UsersController < ApplicationController
  # before_action :authorized, only: [:show]
  before_action :logged_in_user, only: [:edit, :update, :show, :delete]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:delete]

  def index
    # default per_page is 30 and ordering is `ASC`
    @user = User.paginate(page: params[:page], per_page: 30).order('name ASC')
  end

  def new
    @user = User.new
  end

  def show
    begin
      @user = User.find(params[:id])
      @microposts = @user.microposts.paginate(page: params[:page], per_page: 15)
      # debugger
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s
      }, status: :not_found
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate account"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by_id (params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "user #{params[:id]} deleted"
    redirect_to users_url
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  # follow specific BL
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find_by_id(params[:id])
    flash[:danger] = "Unauthorized" unless current_user?(@user)
    redirect_to(root_url) unless current_user?(@user)
  end
end
