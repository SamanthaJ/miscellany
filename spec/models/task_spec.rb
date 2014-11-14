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

  it "is invalid without a priority" do 
    task = build(:task, priority: nil)
    task.valid?
    expect(task.errors[:priority]).to include("can't be blank")
  end

  it "is invalid without a duration_in_minutes" do 
    task = build(:task, duration_in_minutes: nil)
    task.valid?
    expect(task.errors[:duration_in_minutes]).to include("can't be blank")
  end
end