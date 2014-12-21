class Fact < ActiveRecord::Base
  validates_presence_of :question, :answer
  validates :question, length: { maximum: 350 }
  belongs_to :user
end
