class DepartmentCasesController < ApplicationController
  def index
    if params[:search_input]
      @department = Department.find(params[:id])
      @investigations = @department.investigations.search_investigations(params[:search_input]).order(sort_column + " " + sort_direction)
    else
      @department = Department.find(params[:id])
      @investigations = @department.investigations.show_true.order(sort_column + " " + sort_direction)
    end
  end

  def new
    @department = Department.find(params[:id])
    @investigation = Investigation.new
  end

  def edit
  end
end