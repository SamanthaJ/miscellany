require 'rails_helper'

describe Fact do
  it "has a valid factory" do 
    expect(build(:fact)).to be_valid
  end

  it "is invalid without a question" do 
    fact = build(:fact, question: nil)
    fact.valid?
    expect(fact.errors[:question]).to include("can't be blank")
  end

  it "is invalid without an answer" do 
    fact = build(:fact, answer: nil) 
    fact.valid?
    expect(fact.errors[:answer]).to include("can't be blank")
  end
end 

