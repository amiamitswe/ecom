class Api::V1::UsersController < ApplicationController

  before_action :get_user, only: [:show, :update]

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
    if @user.valid? && @user.save
      # @user.status 200
      render 'v1/users/create', status: :created

    else
      # render :json => {error: @user.errors.full_messages}
      @user.errors.full_messages
      # @users.status 403
      render 'v1/users/create', status: :forbidden
    end
  end

  def update
    if @user.present?
      if user_params.present?
        if @user.update(user_params)
          render 'v1/users/create', status: :accepted
        else
          render :json => { error: @user.errors.full_messages }
        end
      end
    else
      render :json => { error: @user.errors.full_messages }
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
