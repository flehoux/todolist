class TasksController < ApplicationController
  include VariableHelper

  def new
    @task = project.tasks.new
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

    def task_params
      params.require(:task).permit(:title, :description, :category)
    end
end
