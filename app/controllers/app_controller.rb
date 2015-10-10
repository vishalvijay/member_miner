class AppController < ApplicationController
  respond_to :json

  protected

  def respond_errors error, status = :bad_request
    error_key = error.is_a?(Array)? :errors : :error
    format_based_respose({error_key => error}, status)
  end

  def format_based_respose hash, status = :ok
    respond_to do |format|
      if params[:response].present? && params[:response].downcase == "pdf"
        pdf_respose hash, status
      else
        format.pdf do
          pdf_respose hash, status
        end
        format.all do
          respond_with(hash, status: status)
        end
      end
    end
  end

  private

  def pdf_respose hash, status
  end
end