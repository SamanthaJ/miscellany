require 'rails_helper'

describe Post do 
  it "has a valid factory" do 
    expect(build(:post)).to be_valid
  end

  # it "allows two comments to share a post" do 
  #   create(:post,
  #     title: 'My post',
  #     body: "This is my amazing post")
  #   expect(build(:post,
  #     title: 'My post',
  #     body: "This is my amazing post")).to be_valid
  # end
  
  # delete
  # it "is valid with a title and body" do 
  #   post = Post.new(
  #     title: "Post 1",
  #     body: "Hello this is my first post")
  #   expect(post).to be_valid
  # end

  it "is invalid without a title" do 
    post = build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a body" do 
    post = build(:post, body: nil)
    post.valid?
    expect(post.errors[:body]).to include("can't be blank")
  end
end
