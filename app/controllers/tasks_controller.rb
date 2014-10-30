class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @tasks_complete = Task.where(complete: false)
    @tasks_complete = Task.where(complete: true)


  end


  def create
    @task = Task.new(task_params)
    @tasks = Task.all
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Post was successfully created.' }  
        format.json { render action: 'index', status: :created, location: @task }
      else
        format.html { render action: 'new' } 
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)


    flash.notice = "'#{@task.task_type}' has been Updated!"

    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
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
