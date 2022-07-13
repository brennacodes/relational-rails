class DepartmentCasesController < ApplicationController
  def index
    @department = Department.find(params[:id])
    @investigations = Investigation.where(department_id: @department.id)
  end

  def new
    @department = Department.find(params[:id])
    @investigation = Investigation.new
  end

  def edit
  end

end