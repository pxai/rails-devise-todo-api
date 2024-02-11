class TasksController < ApplicationController
  include CheckToken
  prepend_before_action :check_token
  #  before_action :authenticate_user!
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = @user.tasks

    render json: @tasks
  end

  def show
    render json: @task
  end

  def new
    @task = @user.tasks.build

    render json: @task
  end

  def edit
    if @task
      render json: @task
    else
      render json: { error: true, msg: 'Error updating Referral' }.to_json
    end
  end

  def create
    @task = @user.tasks.build(task_params)

    if @task.save
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    @task.name = params[:name]
    @task.completed = params[:completed]

    if @task.save
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @task
      @task.destroy
      render json: @task
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private
    def set_task
      begin
        @task = @user.tasks.find(params[:id])
      rescue
        @task = nil
      end
    end

    def task_params
      params.require(:task).permit(:name, :completed)
    end
end
