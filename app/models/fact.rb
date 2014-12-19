class Fact < ActiveRecord::Base
  validates_presence_of :question, :answer
  belongs_to :user
end
