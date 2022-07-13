module ApplicationHelper

  def sortable(column, title = nil)
    # either use the given title or make the title the column name
    title ||= column.titleize
    # if a column is being sorted, note the current sort direction
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    # if a column is being sorted as ascending, change the direction to descending, otherwise set the default direction to ascending
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    # create the link with the title, the column name, and the direction, note the css class for implementing an arrow indicating current sort column and direction
    sort_arrow = ""
    if(column == sort_column)
      if(direction == "desc")
        sort_arrow = " ▼"
      elsif(direction == "asc")
        sort_arrow = " ▲"
      end
    end
    link_to title + sort_arrow, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def search_all(search_term)
    if search_term.present?
      @departments = Department.search_all(search_term)
    else
      @departments = Department.all
    end
  end
end
