class ListsController < ApplicationController
   before_action :authenticate_user!
  
  def index
    @lists = current_user.lists
    @task = current_user.tasks.new
  end

  def create
    @list= current_user.lists.new(list_params)
    respond_to do |format|
      if @list.save
        format.html { redirect_to list_tasks_path(@list), notice: 'ToDo list was successfully created.' }  
        format.json { render action: 'index', status: :created, location: @list }
      else
        format.html { render action: 'new' } 
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    flash.notice = "'#{@list.title}' has been Deleted!"
    @list.destroy

    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end
