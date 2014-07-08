module TasksHelper

  def fill_category
    if params.has_key?(:category)
      params[:category]
    else
      @task.category
    end
  end
end
