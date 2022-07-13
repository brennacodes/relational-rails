class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[ show edit update destroy ]

  def index
    @departments = Department.search_departments(params[:search_input]).order(sort_column + " " + sort_direction)
    if @departments.empty?
      @departments = Department.all.order(sort_column + " " + sort_direction)
    else
      @departments
    end
  end

  def show
    @department = Department.find(params[:id])
    @num_cases = @department.investigations.count
  end

  def new
    @department = Department.new
  end

  def edit
    @department = Department.find(params[:id])
  end
  
  def create
    @department = Department.new(department_params)
    @department.save
    redirect_to departments_url
  end

  def update
    @department.update(department_params)
    redirect_to department_url
  end
  
  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_url
  end

  private
    def set_department
      # Use callbacks to share common setup or constraints between actions.
      @department = Department.find(params[:id])
    end

    def department_params
      # Only allow a list of trusted parameters through.
      params.require(:department).permit(:name, :address, :jurisdiction, :active_cases, :is_federal)
    end

end
