# frozen_string_literal: true

class UsersController < ApplicationController
  rescue_from ::Services::AuthError do |exception|
    render json: exception, status: 403
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    user = ::Users::CreateUserService.call(**user_params, operated_by: operator_id)
    render json: { user: user }, status: :ok
  end

  # PATCH/PUT /users/1
  def update
    user = ::Users::UpdateUserService.call(**user_params, operated_by: operator_id)
    render json: { user: user }, status: :ok
    # render json: @user.errors, status: :unprocessable_entity
  end

  # DELETE /users/1
  def destroy
    ::Users::DeleteUserService.call(id: user_id, operated_by: operator_id)
    render json: {}, status: :ok
  end

  private

  def user_id
    params.permit(:id)[:id]
  end

  # Only allow a list of trusted parameters through.
  def user_params
    # { user: { id: 1234, role: admin }, current_user_id: 1234  }
    params.require(:user).permit(:id, :role)
  end

  def operator_id
    request.headers[:operator_id]
  end
end
