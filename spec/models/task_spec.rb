require 'rails_helper'

describe Task do
  it "has a valid factory" do 
    
    expect(build(:task)).to be_valid
  end

  it "is invalid without a task_type" do 
    task = build(:task, task_type: nil)
    task.valid?
    
    expect(task.errors[:task_type]).to include("can't be blank")
  end  
end