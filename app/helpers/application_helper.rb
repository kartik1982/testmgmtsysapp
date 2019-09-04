module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    
    link_to title, params.permit(:release_id, :project_id, :testcycle_id).merge(sort: column, direction: direction), {class: css_class}
  end

  def copyright_generator(name, msg)
    "Copyright &copy;#{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
  end

  def sort_column
    Report.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
