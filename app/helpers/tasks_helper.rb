module TasksHelper

  def fill_category
    if params.has_key?(:category)
      params[:category]
    else
      @task.category
    end
  end

  def previous_category_button(task)
    return "" if task.category == 1

    link = link_to "<", project_task_path(@project, task.id, task: { category: task.category - 1 }), method: :patch

    html = <<-HTML
    <div class="previous-cat">
      <div class="icon icon-text previous-icon">
          #{link}
      </div>
    </div>
    HTML

    html.html_safe
  end

  def next_category_button(task)
    return "" if task.category == 3

    link = link_to ">", project_task_path(@project, task.id, task: { category: task.category + 1 }), method: :patch

    html = <<-HTML
    <div class="next-cat">
      <div class="icon icon-text next-icon">
          #{link}
      </div>
    </div>
    HTML

    html.html_safe
  end
end
