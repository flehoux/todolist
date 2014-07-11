class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def show
    @ideas = project.tasks.where(category: 1)
    @progress = project.tasks.where(category: 2)
    @completed = project.tasks.where(category: 3)
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:notice] = "Project created!"
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
    load_project
  end

  def update
    if project.update(project_params)
      redirect_to project
    else
      render 'edit'
    end
  end

  def destroy
    project.destroy

    redirect_to projects_path
  end

private

  def project
    @project ||= current_user.projects.find(params[:id])
  end
  alias_method :load_project, :project

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
