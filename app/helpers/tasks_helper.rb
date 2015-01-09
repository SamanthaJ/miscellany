module TasksHelper

  def complete task
    "opaque" if task.complete
  end
  
  def strike_through task 
    task.complete ? "strike-through " : ""
  end

  def task_duration task
    task.duration_in_minutes.blank? ? "" : "#{task.duration_in_minutes} minutes" 
  end
end
