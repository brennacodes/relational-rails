class ApplicationController < ActionController::Base
  helper_method :sort_column, :sort_direction

  private
    def sort_column
      # If a sort parameter is given, use it. Otherwise, default to created_at column.
      Department.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      # If a sort direction parameter is given, use it. Otherwise, default to descending (created_at).
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end
end
