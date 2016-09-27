class TasksController < ApplicationController
  def index
    @tasks = Task.active.for_company(current_user.company).to_json(only: task_json_params)
  end

private

  def task_json_params
    [:slug, :title, :due_at, :completed_at]
  end
end
