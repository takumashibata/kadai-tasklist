class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  
  def index
#    @pagy, @users = pagy(User.order(id: :desc), items: 25)
  end

  def show
#    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。ログインして下さい'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end


  def edit
#    @user = User.find(params[:id])
  end

  def update
#    @user = User.find(params[:id])
#    if @user.update(user_params)
#      redirect_to @user, notice: "ユーザー「#{@user.nsame}」を更新しました。"
#    else
#      render :edit
#    end
  end

  def destroy
#    @user = User.find(prams[:id])
#    @user.destroy
#    redirect_to users_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end