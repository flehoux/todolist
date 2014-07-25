class PartnershipsController < ApplicationController
  before_action :owner_user, only: [:index, :create, :destroy]

  def index
    @partnerships = project.partnerships
    @partnership = Partnership.new
  end

  def create
    @user = User.find_by(email: params[:email])
    project.partnerships.create(user_id: @user.id)
    redirect_to project_access_index_path(project)
  end

  def destroy
    partnership.destroy unless partnership.owner == true
    redirect_to project_access_index_path(project)
  end

private

  def project
    @project ||= current_user.projects.find(params[:project_id])
  end

  def partnership
    @partnership ||= project.partnerships.find(params[:id])
  end

  def partnership_params
    params.require(:partnership).permit(:user_id)
  end

  def owner_user
    redirect_to project_path(project) unless project.partnerships.find_by(user_id: current_user).owner?
  end
end
