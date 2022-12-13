class Api::V1::CategoriesController < ApplicationController

  before_action :get_category, only: [:show]
  def index
    @categories = Category.all
    render :'v1/categories/index', status: :created
  end

  def show
    render :'v1/categories/show', status: :created
  end

  private

  def get_category
    @category = Category.find(params[:id])
  end
end
