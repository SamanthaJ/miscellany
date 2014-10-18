class TasksController < ApplicationController

  def index
    @tasks = Task.all

  end

  def create
    @task = Task.new
    redirect_to tasks_path

  end

  def show
    @task = Task.find(params[:id])
  end

end
