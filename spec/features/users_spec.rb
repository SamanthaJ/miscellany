require 'rails_helper'

feature 'User management' do 
  before :each do 
    visit_sign_in_page
  end
  
  scenario 'user signs up with valid info' do
    click_link 'Sign up'
    fill_in 'Email', with: 'email@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'logs in properly' do
    log_in
    
    expect(page).to have_content ('Signed in successfully.')
  end

  scenario "doesn't allow log in with invalid info" do   
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: ''
    click_button 'Log in'
    
    expect(page).to have_content('Invalid email or password.')
  end 

  scenario "logs out properly" do 
    log_in
    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
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






