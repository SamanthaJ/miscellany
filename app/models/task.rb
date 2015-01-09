class Task < ActiveRecord::Base
  validates_presence_of :task_type
  belongs_to :user
  belongs_to :list
end
