require 'rails_helper'

feature 'Blogger' do 
  before :each do
    visit_sign_in_page
    log_in
  end

  scenario 'displays blog entries' do 
    click_link 'Blogger'

    expect(page).to have_content ('create a blog post')
  end
  scenario 'displays create post button' do 
    click_link 'Blogger'
    click_link 'create a blog post'

    expect(page).to have_button ('Create Post')
  end
  scenario 'creates blog post' do 
    click_link 'Blogger'
    click_link 'create a blog post' 
    fill_in 'title', with: 'post title'
    fill_in 'body', with: 'post body'
    click_button 'Create Post'

    expect(page).to have_content ('Post was successfully created.')
  end 
end

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






