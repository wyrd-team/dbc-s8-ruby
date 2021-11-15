# frozen_string_literal: true

class UsersController < ApplicationController
  # GET /users
  def index
    @users = ::Users::IndexUserService.call(operated_by: operator_id)
    render json: @users
  end

  # GET /users/1
  def show
    @user = ::Users::ShowUserService.call(**user_params, operated_by: operator_id)
    render json: @user
  end

  # POST /users
  def create
    user = ::Users::CreateUserService.call(**user_params, operated_by: operator_id)
    render json: { user: user.attributes }, status: :ok
  end

  # PATCH/PUT /users/1
  def update
    user = ::Users::UpdateUserService.call(**user_params, operated_by: operator_id)
    render json: { user: user.attributes }, status: :ok
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
end
