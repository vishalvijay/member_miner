class AppController < ApplicationController
  respond_to :json

  protected

  def respond_errors error, status = :bad_request
    error_key = error.is_a?(Array)? :errors : :error
    format_based_respose({error_key => error}, status)
  end

  def format_based_respose hash, status = :ok
    if params[:response].present? && params[:response].downcase == "pdf"
      pdf_respose hash, status
    else
      respond_to do |format|
        format.pdf do
          pdf_respose hash, status
        end
        format.all do
          render json: hash, status: status
        end
      end
    end
  end

  private

  def pdf_respose hash, status
    filename = Rails.root.join("tmp").join("response_#{DateTime.now.strftime('%Q')}.pdf").to_s
    Prawn::Document.generate(filename) do
      text hash.to_json
    end
    send_file filename, type: "application/pdf", status: status, disposition: :inline
  end
end