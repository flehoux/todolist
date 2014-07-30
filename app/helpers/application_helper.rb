module ApplicationHelper
  
  def display_messages(error, notice, alert, success)
    content_tag :div, :class => "messages-box" do
      concat display_message(error, "error") if error
      concat display_message(notice, "notice") if notice
      concat display_message(alert, "alert") if alert
      concat display_message(success, "success") if success
    end if error || notice || alert || success
  end

  def display_message(message, classes)
    content_tag :div, :class => "message-box " + classes do
      content_tag(:span, message, :class => "small-text dark-gray") +
      content_tag(:i, nil, :class => "icon-remove message-button")
    end
  end
end