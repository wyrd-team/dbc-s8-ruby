# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    user = ::User.create!(user_params)
    render json: { user: user }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
