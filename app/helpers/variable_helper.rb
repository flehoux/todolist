module VariableHelper

  def project
    @project ||= current_user.projects.find(params[:project_id] || params[:id])
  end

  def task
    @task ||= project.tasks.find(params[:id])
  end
end