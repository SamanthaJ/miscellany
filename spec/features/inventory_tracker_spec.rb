require 'rails_helper'

feature 'InventoryTracker' do 
  before :each do
    visit_sign_in_page
    log_in
  end

  scenario 'Creates product' do 
    create_product

    expect(page).to have_content('Product was successfully created.')
  end

  scenario 'Deletes product' do
    create_product
    click_link '| Delete |'

    expect(page).to have_content('Product was successfully destroyed.')
  end

  scenario 'Edits product' do 
    create_product
    click_link '| Edit |'
    fill_in 'Price', with: '6'
    click_button 'Update Product'

    expect(page).to have_content('Product was successfully updated.')
  end
end

def create_product 
  click_link 'InventoryTracker'
  click_link 'create a new product'
  @product = build(:product)
  fill_in 'Title', with: '@product.title'
  fill_in 'Description', with: '@product.description'
  fill_in 'Price', with: '@product.price'
  fill_in 'Stock', with: '@product.stock'
  click_button 'Create Product'
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

