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

  private
  def get_user
    @user = User.find(params[:id])
  end

end
