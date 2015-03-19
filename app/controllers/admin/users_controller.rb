class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    authorize! :read, User

    @users = User.all

    respond_to do |format|
      format.html
    end
  end

  def show
    authorize! :read, User
    @user = User.find(params[:id])
  end

  def new
    authorize! :create, User
    @user = User.new
    @user.build_data
  end

  def create
    authorize! :create, User
    @user = User.new(user_params)

    if @user.save
      respond_with @user, location: [:admin, @user]
    else
      render 'new'
    end
  end

  def edit
    authorize! :update, User

    @user = User.includes(:data).find(params[:id])
  end

  def update
    authorize! :update, User

    @user = User.includes(:data).find(params[:id])
    @user.update_attributes(user_params)
    respond_with @user, location: [:admin, @user]
  end

  def destroy
    authorize! :destroy, User

    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(
      :username, :email, :password, :password_confirmation,
      data_attributes: [:id, :name, :cpf]
    )
  end
end
