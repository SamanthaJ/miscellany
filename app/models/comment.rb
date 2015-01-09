class Comment < ActiveRecord::Base
  validates_presence_of :user_name, :body
  belongs_to :post
end
