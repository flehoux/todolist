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

    link = link_to project_task_path(@project, task.id, task: { category: task.category - 1 }), remote: true, method: :patch do
      content_tag :div, :class => "previous-cat" do
        content_tag :div, '<', :class => "icon icon-text previous-icon"
      end
    end

    html = <<-HTML
      #{link}
    HTML

    html.html_safe
  end

  def next_category_button(task)
    return "" if task.category == 3

    link = link_to project_task_path(@project, task.id, task: { category: task.category + 1 }), remote: true, method: :patch do
      content_tag :div, :class => "next-cat" do
        content_tag :div, '>', :class => "icon icon-text next-icon"
      end
    end

    html = <<-HTML
      #{link}
    HTML

    html.html_safe
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, '', remote: true, :class => "button button-red link-remove")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to(name, '', data: { association: "#{association}", fields: "#{fields}" }, remote: true, 
                      :class => "link-add")
    # link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
end
