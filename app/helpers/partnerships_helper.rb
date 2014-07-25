module PartnershipsHelper

  def user_role(partnership)
    if partnership.owner?
      'owner'
    else
      'partner'
    end
  end

  def link_to_remove_collab(partnership)
    link = link_to project_access_path(@project, partnership.id), method: :delete do
      content_tag(:span, 'x', :class => "partnership-remove small-text")
    end

    html = <<-HTML
        #{link}
    HTML

    html.html_safe
  end
end