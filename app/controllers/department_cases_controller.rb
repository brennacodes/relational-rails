class DepartmentCasesController < ApplicationController
  def index
    @department = Department.find(params[:id])
    @investigations = @department.investigations
  end
end