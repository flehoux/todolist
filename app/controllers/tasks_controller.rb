class TasksController < ApplicationController
  before_action :load_project, only: [:new, :create, :edit, :update, :destroy]

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      flash[:notice] = "Project created!"
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

    def load_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :category)
    end
end
