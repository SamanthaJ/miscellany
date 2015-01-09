require 'rails_helper'

describe List do
  it "has a valid factory" do 
    expect(build(:list)).to be_valid
  end
  
  it "is invalid without a title " do 
    list = build(:list, title: nil)
    list.valid?
    expect(list.errors[:title]).to include("can't be blank")
  end 
end 
