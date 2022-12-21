class Api::V1::UsersController < ApplicationController

  before_action :get_user, only: [:show]

  def index
    @users = User.all
    @users.count
    render 'v1/users/index', status: :found
  end

  def show
    render 'v1/users/show', status: :found
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      render 'v1/users/create', status: :created
    else
      render :json => {error: @user.errors.full_messages}
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :phone, :role, :password)
  end

end
