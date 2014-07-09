module ProjectsHelper

  def project_link(project)
    if current_page?(projects_path)
      project_path(project)
    elsif current_page?(project_path(project))
      edit_project_path(project)
    end
  end
end
