module PartnershipsHelper
  
  def add_user_button(user)
    link = link_to project_partnerships_path(@project, partnership: { user_id: user.id }), method: :post do
      retina_image_tag(user, :photo, :thumb, :default => [40, 40], :class => "thumbnail") +
      content_tag(:div, '+', :class => "thumb-overlay thumbnail")
    end

    html = <<-HTML
      <div class="collaborators overlay-bg">
        #{link}
      </div>
    HTML

    html.html_safe
  end

  def remove_user_button(partnership)
    link = link_to project_partnership_path(@project, partnership.id), method: :delete do
      retina_image_tag(partnership.user, :photo, :thumb, :default => [40, 40], :class => "thumbnail") +
      content_tag(:div, 'x', :class => "thumb-overlay thumbnail")
    end

    html = <<-HTML
      <div class="collaborators overlay-bg">
        #{link}
      </div>
    HTML

    html.html_safe
  end
end