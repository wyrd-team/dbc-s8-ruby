# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

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
    user = ::Users::CreateUserService.call(**user_params, operated_by: auth_params[:current_user_id])
    render json: { user: user }, status: :ok
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    # { user: { role: admin }, current_user_id: 1234  }
    params.require(:user).permit(:role)
  end

  def auth_params
    # 認証する方法がないためパラメータでカレントユーザのIDを受け取る様にする
    params.permit(:current_user_id)
  end

  def admin?
    # TODO: この辺のテストを書いて動作を確認する
    User.find(auth_params[:current_user_id]).admin?
  end
end
