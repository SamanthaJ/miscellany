require 'rails_helper'

describe User do 
  it "has a valid factory" do 
    
    expect(build(:user)).to be_valid
  end

  it "is valid with an email address and password" do 
    user = build(:user)
    
    expect(user).to be_valid
  end
end 