# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show update destroy]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    # @task = Task.new(task_params)

    # if @task.save
    #   render json: @task, status: :created, location: @task
    # else
    #   render json: @task.errors, status: :unprocessable_entity
    # end
    task = ::Tasks::CreateTaskService.call(**task_params, operated_by: operator_id)
    render json: { task: task }, status: :ok
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def user_id
    params.permit(:user_id)[:user_id]
  end

  # Only allow a list of trusted parameters through.
  def task_params
    # { user: { id: 1234, role: admin }, current_user_id: 1234  }
    params.fetch(:task, {})
    # params.require(:task).permit(
    #   :id, :expired_on, :priority, :status, :user_id, :name, :description
    # )
  end
end
