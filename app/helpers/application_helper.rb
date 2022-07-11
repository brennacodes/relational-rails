module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def arrow
    if params[:direction] == 'asc'
        image_tag("caret-up-fill.svg", alt: "up arrow", size: "15x15")
    elsif params[:direction] == 'desc'
        image_tag("caret-down-fill.svg", alt: "down arrow", size: "15x15")
    else
        # either a blank image to show or just force no-display of image
    end
end
end
