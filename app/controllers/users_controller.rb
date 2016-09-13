class UsersController < BaseController
before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to login_path
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
