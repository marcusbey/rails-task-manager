class TasksController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :done, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
   @task.update(task_params)
   redirect_to tasks_path
  end

  def done
    @task.status = true
    @task.save
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

private

  def task_params
    params.require(:task).permit(:name, :description, :status)
  end
  def set_restaurant
    @task = Task.find(params[:id])
  end

end
