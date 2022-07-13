module ApplicationHelper
  def sortable(column, title = nil)
    # either use the given title or make the title the column name
    title ||= column.titleize
    # if a column is being sorted, note the current sort direction
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    # if a column is being sorted as ascending, change the direction to descending, otherwise set the default direction to ascending
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    # create the link with the title, the column name, and the direction, note the css class for implementing an arrow indicating current sort column and direction
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def arrow
    if params[:direction] == 'asc'
        image_tag("caret-up.png", alt: "up arrow", size: "15x15")
    elsif params[:direction] == 'desc'
        image_tag("caret-down.png", alt: "down arrow", size: "15x15")
    else
        # either a blank image to show or just force no-display of image
    end
  end
end
