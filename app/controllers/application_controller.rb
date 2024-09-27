class ApplicationController < ActionController::API
  before_action :authenticate_api_key

  private

  def authenticate_api_key
    api_key = request.headers['Authorization']&.split(' ')&.last

    unless api_key && valid_api_key?(api_key)
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def valid_api_key?(api_key)
    api_key == ENV['API_KEY']
  end
end
