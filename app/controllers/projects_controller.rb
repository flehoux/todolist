class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_project, only: [:show, :edit, :update, :destroy]
  before_action :allowed_user, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
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
      redirect_to new_project_path
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy

    redirect_to projects_path
  end

  private

    def project_params
      params.require(:project).permit(:title, :description)
    end

    def current_project
      @project = Project.find(params[:id])
    end

    def allowed_user
      redirect_to(projects_path) unless current_user == @project.user
    end
end
