require 'rails_helper'

describe Comment do 
  it "has a valid factory" do
    expect(build(:comment)).to be_valid
  end
  it "is valid with a user_name and body" do 
    comment = Comment.new(
      user_name: "Yan",
      body: "Comment number 1")
    expect(comment).to be_valid
  end
  
  it "is invalid without a user_name" do 
    comment = build(:comment, user_name: nil)
    post.valid?
    expect(comment.errors[:user_name]).to include("can't be blank")
  end
  
  it "is invalid without a body" do
    comment = build(:comment, body: nil)
    post.valid?
    expect(comment.errors[:body]).to include("can't be blank")
  end
end
