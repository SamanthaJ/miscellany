require 'rails_helper'

feature 'FactFlipper' do 
  before :each do
    visit_sign_in_page
    log_in
  end
  scenario 'creates fact' do
    click_link 'FactFlipper'
    click_link 'create a flip card'
    @fact = build(:fact)
    fill_in 'question', with: '@fact.question'
    fill_in 'answer', with: '@fact.answer'
    click_button "Submit"

    expect(page).to have_content("flip card was successfully created.")
  end
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
