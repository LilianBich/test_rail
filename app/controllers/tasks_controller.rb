class TasksController < ApplicationController
  # to create all this instance method I used
  # $ rails generate controller tasks index show new edit update create delete

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    Task.update(params[:id],task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
