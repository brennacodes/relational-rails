class DepartmentsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_department, only: %i[ show edit update destroy ]

  def index
    @departments = Department.order(sort_column + ' ' + sort_direction)
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
      if @department.save
        redirect_to departments_url
      else
        render :new, status: :unprocessable_entity 
      end
  end

  def update
    if @department.update(department_params)
      redirect_to department_url
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to departments_url
  end

  private
    def sort_column
      # If a sort parameter is given, use it. Otherwise, default to created_at column.
      Department.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      # If a sort direction parameter is given, use it. Otherwise, default to descending (created_at).
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end

    def set_department
      # Use callbacks to share common setup or constraints between actions.
      @department = Department.find(params[:id])
    end

    def department_params
      # Only allow a list of trusted parameters through.
      params.require(:department).permit(:name, :address, :jurisdiction, :active_cases, :is_federal)
    end
end
