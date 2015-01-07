class TasksController < ApplicationController
  before_action :authenticate_user!

  
  def index
    @list = current_user.lists.find(params[:list_id])
    @tasks = @list.tasks.sort_by { |task| task.complete ? 1 : 0 }
  end


  def create
    @list = current_user.lists.find(params[:list_id])
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
    @list = current_user.lists.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.update(task_params)

    flash.notice = "'#{@task.task_type}' has been Updated!"

    redirect_to list_tasks_path @list
  end



  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash.notice = "'#{@task.task_type}' has been Deleted!"

    redirect_to tasks_path

  end


private

  def task_params
    params.require(:task).permit(:task_type, :priority, :duration_in_minutes, :complete, :optimal, :user_id)
  end
end

  def set_task
    @task = Task.find(params[:id])
  end
