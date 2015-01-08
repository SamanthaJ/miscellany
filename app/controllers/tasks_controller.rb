class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list
  before_action :set_task, except: [:index, :create]

  def index
    @tasks = @list.tasks.sort_by { |task| task.complete ? 1 : 0 }
  end

  def create
    @task = @list.tasks.new(task_params)
    @tasks = current_user.tasks.all
    respond_to do |format|
      if @task.save
        format.html { redirect_to list_tasks_path(@list), notice: 'Post was successfully created.' }  
        format.json { render action: 'index', status: :created, location: @task }
      else
        format.html { render action: 'new' } 
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task.update(task_params)
    flash.notice = "'#{@task.task_type}' has been Updated!"

    redirect_to list_tasks_path @list
  end

  def destroy
    @task.destroy
    flash.notice = "'#{@task.task_type}' has been Deleted!"

    redirect_to list_tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:task_type, :priority, :duration_in_minutes, :complete, :optimal, :user_id)
  end
end

def set_list
  @list = current_user.lists.find(params[:list_id]) 
end

def set_task
  @task = Task.find(params[:id])
end

