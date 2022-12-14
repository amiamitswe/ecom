class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :param_missing

  private

  def not_found(e)
    render json: { error: e, status: :unprocessable_entity }, status: :unprocessable_entity
  end

  def param_missing(e)
    render json: { error: e, status: :bad_request }, status: :bad_request
  end
end
