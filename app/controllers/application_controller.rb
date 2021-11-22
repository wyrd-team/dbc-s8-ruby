# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ::Services::AuthError do |exception|
    render json: exception, status: 403
  end

  rescue_from ::ActiveRecord::RecordInvalid do |exception|
    render json: exception, status: :unprocessable_entity
  end

  private

  def operator_id
    request.headers[:operator_id]
  end
end
