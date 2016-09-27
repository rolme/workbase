class TasksController < ApplicationController
  def index
    @tasks = Task.active.for_company(current_user.company).to_json(only: task_json_params)
  end

  def as_json
    render json: Task.active.for_company(current_user.company).to_json(only: task_json_params)
  end

  def create
    task = Task.new(task_params)
    task.company = current_user.company

    if task.save
      render json: task.to_json(only: task_json_params)
    else
      render json: { message: task.errors.full_messages, status: 422 }
    end
  end

private

  def task_params
    params.require(:task).permit(:title, :due_at, :completed_at, :deleted_at, :priority)
  end

  def task_json_params
    [:slug, :title, :due_at, :completed_at]
  end
end
