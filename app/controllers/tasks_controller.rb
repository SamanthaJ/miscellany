class TasksController < ApplicationController

  def index
    @tasks = Task.all

  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @tasks, notice: 'Post was successfully created.' }  
      else
        format.html { render action: 'new' } 
      end
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task.destroy

    flash.notice = "'#{@task.task_type}' has been Deleted!"

    redirect_to tasks_path
  end


  private

  def task_params
    params.require(:task).permit(:task_type, :priority, :duration_in_minutes, :complete, :optimal, :user_id)
  end
end
