class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    @users.count
    render 'v1/users/index', status: :found
  end
end
