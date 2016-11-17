class Api::TasksController < ApplicationController

  def index
    task_list = tasks
    render json: task_list.to_json(only: task_json_params)
  end

  def create
    task = Task.new(task_params)
    task.due_at = Date.strptime(task_params[:due_at], '%m/%d/%Y') if task_params[:due_at].present?
    task.company = current_user.company

    if task.save
      render json: task.to_json(only: task_json_params)
    else
      render json: { message: task.errors.full_messages, status: 422 }
    end
  end

  def update
    task = tasks.find_by(slug: params[:slug])
    task.assign_attributes(task_params)
    # the due_at param will be posted as MM/DD/YYYY but needs to be DD/MM/YYYY in order to save
    task.due_at = Date.strptime(task_params[:due_at], '%m/%d/%Y') if task_params[:due_at].present?

    task.completed_at = params[:completed_at] == true ? Time.now : nil

    if task.save
      render json: task.to_json(only: task_json_params)
    else
      render json: { message: task.errors.full_messages, status: 422 }
    end
  end

  def destroy
    task = tasks.find_by(slug: params[:slug])
    task.delete
    render json: { slug: params[:slug], message: 'Task deleted', status: 200 }
  end

private

  def tasks
    Task.active.for_company(current_user.company)
  end

  def task_params
    params.require(:task).permit(:title, :due_at, :completed_at, :deleted_at, :priority)
  end

  def task_json_params
    [:slug, :title, :due_at, :completed_at]
  end
end
