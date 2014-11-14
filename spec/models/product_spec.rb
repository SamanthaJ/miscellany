require 'rails_helper'

describe Product do 
  it "has a valid factory" do  
    expect(build(:product)).to be_valid
  end

  # it "is valid with a title, price, description, and stock" do
  #   product = Product.new(
  #     title: "RDLF"
  #     price: "$3.00"
  #     description: "small cigar"
  #     stock: "2,500")
  #   expect(product).to be_valid
  # end

  it "is invalid without a title" do 
    product = build(:product, title: nil)
    product.valid?
    expect(product.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a price" do 
    product = build(:product, price: nil)
    product.valid?
    expect(product.errors[:price]).to include("can't be blank")
  end

  it "is invalid without a description" do 
    product = build(:product, description: nil)
    product.valid?
    expect(:product.errors[:description]).to include("can't be blank")
  end

  it "is invalid without a stock" do 
    product = build(:product, stock: nil)
    product.valid?
    expect(:product.errors[:stock]).to include("can't be blank")
  end
end
