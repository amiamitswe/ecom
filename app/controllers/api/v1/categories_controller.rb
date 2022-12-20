class Api::V1::CategoriesController < ApplicationController

  before_action :get_category, only: [:show, :update]

  def index
    @categories = Category.all
    render :'v1/categories/index', status: :found
  end

  def show
    render :'v1/categories/show'
  end

  def create
    @category = Category.new(category_params)
    if @category.valid? && !!@category.status
      @category.save
      render :'v1/categories/create', status: :created
    else
      render :json => { error: @category.errors.full_messages }
    end
  end

  def update
    if @category.valid?
      if category_params.present?
        @category.update(category_params)
        render :'v1/categories/show', status: :accepted
      end
    else
      render :json => { error: @category.errors.full_messages }
    end
  end

  private

  def get_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :status)
  end

end
