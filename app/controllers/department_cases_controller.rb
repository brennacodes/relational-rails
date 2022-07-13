class DepartmentCasesController < ApplicationController
  def index
    @department = Department.find(params[:id])
    if params[:num_leads]
      @investigations = @department.investigations.num_leads(params[:num_leads]).order(sort_column + " " + sort_direction)
    elsif params[:search_input]
      @investigations = Investigation.search_investigations(params[:search_input])
      @investigations.where('department_id =  ?', @department.id).order(sort_column + " " + sort_direction)
    else
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