require 'rails_helper'

feature 'Blogger' do 
  before :each do
    @user = create(:user)
    
    log_in
  end

  scenario 'displays blog entries' do 
    click_link 'Blogger'

    expect(page).to have_content ('Blog Entries')
  end

  scenario 'displays create post button' do 
    click_link 'Blogger'
    click_link 'Create a blog post'

    expect(page).to have_button ('Create Post')
  end

  scenario 'creates blog post' do 
    click_link 'Blogger'
    click_link 'Create a blog post'
    
    fill_in 'Title', with: 'post title'
    fill_in 'Body', with: 'post body'

    click_button 'Create Post'

    expect(page).to have_content ('Post was successfully created.')
  end 
end

def log_in
  visit root_path
  click_link 'Sign in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Log in'
end




