class DepartmentCasesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @department = Department.find(params[:id])
    @investigations = Investigation.where(department_id: @department.id)
  end

  def new
    @department = Department.find(params[:id])
    @investigation = Investigation.new
  end

  def create
    @department = Department.find(params[:id])
    @investigation = @department.investigations.new(investigation_params)
    if @investigation.save
      redirect_to department_cases_url(@department)
      # render :show, status: :created, location: @department 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  private
    def sort_column
      Investigation.column_names.include?(params[:sort]) ? params[:sort] : "subject"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end