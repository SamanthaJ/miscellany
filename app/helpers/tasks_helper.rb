module TasksHelper
  def strike_through task 
    task.complete ? "strike-through " : ""
  end

  def task_duration task
    task.duration_in_minutes.blank? ? "" : "#{task.duration_in_minutes} minutes" 
  end
end
