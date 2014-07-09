class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_project, only: [:show, :edit, :update, :destroy]
  before_action :allowed_user, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
    @ideas = @project.tasks.where(category: 1)
    @progress = @project.tasks.where(category: 2)
    @completed = @project.tasks.where(category: 3)
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

    def load_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description)
    end

    def allowed_user
      redirect_to(projects_path) unless current_user == @project.user
    end
end
