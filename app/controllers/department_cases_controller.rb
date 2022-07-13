class DepartmentCasesController < ApplicationController
  def index
    @department = Department.find(params[:id])
    if params[:num_leads]
      @investigations = @department.investigations.num_leads(params[:num_leads])
    else
      @investigations = @department.investigations.show_true
    end
  end

  def new
    @department = Department.find(params[:id])
    @investigation = Investigation.new
  end

  def edit
  end

end