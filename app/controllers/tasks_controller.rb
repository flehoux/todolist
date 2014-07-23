class TasksController < ApplicationController
  
  def new
    @task = project.tasks.new
    create_link
  end

  def create
    @task = project.tasks.build(task_params)
    if @task.save
      redirect_to project
    else
      render 'new'
    end
  end

  def edit
    load_task
    create_link
  end

  def update
    respond_to do |format|
      if task.update(task_params)
        format.html { redirect_to project }
        format.js
      else
        format.html { render 'edit' }
      end
    end
  end

  def destroy
    task.destroy

    redirect_to project
  end

private

  def project
    @project ||= current_user.projects.find(params[:project_id])
  end

  def task
    @task ||= project.tasks.find(params[:id])
  end
  alias_method :load_task, :task

  def create_link
    @task.links.build unless @task.links.any?
  end

  def task_params
    params.require(:task).permit(:title, :description, :category, links_attributes: [:id, :link, :_destroy])
  end
end
