module ApplicationHelper
  
  def display_messages(error, notice, alert)
    content_tag :div, :class => "message_box" do
      content_tag(:p, flash[:error], :class => "error small-text error-text") if error
      content_tag(:p, flash[:notice], :class => "notice small-text") if notice
      content_tag(:p, flash[:alert], :class => "alert small-text error-text") if alert
    end if error || notice || alert
  end
end