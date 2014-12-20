class ListsController < ApplicationController
   before_action :authenticate_user!
  
  def index
    @lists = List.where(user_id: current_user.id) if current_user
    @tasks = current_user.tasks.all
  end

  def create
    @list= current_user.lists.new(list_params)
    @lists = current_user.lists.all
    respond_to do |format|
      if @list.save
        format.html { redirect_to list_tasks_path, notice: 'ToDo list was successfully created.' }  
        format.json { render action: 'index', status: :created, location: @list }
      else
        format.html { render action: 'new' } 
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def list_params
    params.require(:list).permit(:title, :user_id)
  end
end
