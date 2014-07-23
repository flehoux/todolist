class PartnershipsController < ApplicationController
  before_action :owner_user, only: [:create, :destroy]

  def create
    project.partnerships.create(partnership_params)
    redirect_to edit_project_path(project)
  end

  def destroy
    partnership.destroy unless partnership.owner == true
    redirect_to edit_project_path(project)
  end

private

  def project
    @project ||= current_user.projects.find(params[:project_id])
  end

  def partnership
    @partnership ||= project.partnerships.find(params[:id])
  end
  # alias_method :load_partnership, :partnership

  def partnership_params
    params.require(:partnership).permit(:user_id)
  end

  def owner_user
    redirect_to project_path(project) unless project.partnerships.find_by(user_id: current_user).owner?
  end
end
