require 'rails_helper'

feature 'User management' do 
  scenario "with valid email and password" do
    sign_up_with 'valid@example.com', 'password'
    
    expect(page).to have_content('Sign Out')
  end 

  scenario "with invalid email" do 
    sign_up_with 'invalid_email', 'password'
    
    expect(page).to have_content('Sign In')
  end

  scenario "with blank password" do 
    sign_up_with 'valid@example.com', ''
    
    expect(page).to have_content('Sign In')
  end
end

  def sign_up_with(email, password)
    vist root_path
    click_link 'Sign in'
    fill_in 'Email', with: 'valid@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
end





# the build up!!!
# describe "Blog" do
#   before :each do
#     sign_in_with_wrong_info
#   end

# the 
#   it 'should not log in' do
#     page.should have_content "Forgot your password?"
#   end
# end

# def sign_in_with_wrong_info
#   visit root_path
#   click_link 'Sign in'
#   fill_in "user_email", with: "myemail@email.com"
#   fill_in "user_password", with: "password"
#   click_button "Log in"
# end

