require 'rails_helper'

feature 'TaskManager' do 
  before :each do
    visit_sign_in_page
    log_in
  end

  scenario 'Creates a todo list' do 
    create_todo_list

    expect(page).to have_content('ToDo list was successfully created.')
  end
  scenario 'Deletes list' do 
    create_todo_list
    click_link 'back'
    click_link 'X' 
    
    expect(page).to have_content("'@list.title' has been Deleted!")
  end
  scenario 'Creates task' do 
    create_todo_list
    create_task

    expect(page).to have_content('Post was successfully created.')
  end
  scenario 'Deletes task' do 
    create_todo_list
    create_task
    click_link 'X'

    expect(page).to have_content("'@task.task_type' has been Deleted!")
  end
end

def create_todo_list 
  click_link 'TaskManager'
  click_link 'create a new todo list'
  @list = build(:list)
  fill_in 'name of your todo list', with: '@list.title'
  click_button 'Create List'
end

def create_task
  click_link 'add a task'
  @task = build(:task)
  fill_in 'add a task', with: '@task.task_type'
  click_button 'Create Task'
end

#extract into helper
def visit_sign_in_page
  visit root_path
  click_link 'Sign in'
end

def log_in
  @user = build(:user)
  @user.save!
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end



