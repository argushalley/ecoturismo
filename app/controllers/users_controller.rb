class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_data
  end

  def create
    @user = User.new(user_params)
    #@user.password = Devise.friendly_token[0,8]
    binding.pry

    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(
      :name, :username, :email, :password, :password_confirmation,
      data_attributes: [:id, :name, :cpf]
    )
  end
end
