module ApplicationHelper
  def sortable(column, title = nil)
    # either use the given title or make the title the column name
    title ||= column.titleize
    # if a column is being sorted as ascending, change the direction to descending, otherwise set the default direction to ascending
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    # create an arrow to indicate which column is being sorted and which direction it is sorted in
    sort_arrow = ""
    if (column == sort_column)
      if (direction == "desc")
        sort_arrow = " ▼"
      elsif (direction == "asc")
        sort_arrow = " ▲"
      end
    end
    # create the link with the title, the column name, and the direction, note the css class for implementing an arrow indicating current sort column and direction
    link_to title + sort_arrow, {:sort => column, :direction => direction}
  end
end
