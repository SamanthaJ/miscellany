class Product < ActiveRecord::Base
  validates_presence_of :title, :price, :description, :stock
  belongs_to :user
end
