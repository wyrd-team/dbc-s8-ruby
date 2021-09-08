class UsersController < ApplicationController
  def create()
    render json: {status: 200}
  end
end
