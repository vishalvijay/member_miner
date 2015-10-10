class AppController < ApplicationController
  respond_to :json

  protected

  def respond_errors error, status = :bad_request
    error_key = error.is_a?(Array)? :errors : :error
    render json: {error_key => error}, status: status
  end
end