class DepartmentCasesController < ApplicationController
  def index
    if params[:search_input]
      @department = Department.find(params[:id])
      @investigations = Investigation.search_investigations(params[:search_input])
      @investigations.where('department_id =  ?', @department.id).order(sort_column + " " + sort_direction)
    elsif params[:num_leads]
      @department = Department.find(params[:id])
      @investigations = @department.investigations.show_true.order(sort_column + " " + sort_direction)
    end
  end

  def new
    @department = Department.find(params[:id])
    @investigation = @department.investigations.new
  end

  def edit
  end

  def create
    @department = Department.find(params[:id])
    @investigation = @department.investigations.new(investigation_params)
    @investigation.save
    redirect_to department_cases_url(@department.id)
  end
end