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
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = @user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :completed)
    end
end
