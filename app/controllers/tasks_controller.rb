class TasksController < ApplicationController
  before_action :load_project, only: [:new, :create, :edit, :update, :destroy]
  # before_action :allowed_user, only: [:edit, :update, :destroy]
  before_action :load_task, only: [:edit, :update, :destroy]

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project }
        format.js
      else
        format.html { render 'edit' }
      end
    end
  end

  def destroy
    @task.destroy

    redirect_to @project
  end

  private

    def load_project
      @project = current_user.projects.find(params[:project_id])
    end

    def load_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :category)
    end

    # def allowed_user
    #   redirect_to(projects_path) unless current_user == @project.user
    # end
end
