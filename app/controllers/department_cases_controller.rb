class DepartmentCasesController < ApplicationController
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
      redirect_to department_url(@department)
    else
      render :new, status: :unprocessable_entity
    end
  end
end