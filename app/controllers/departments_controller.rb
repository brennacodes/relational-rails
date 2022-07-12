class DepartmentsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_department, only: %i[ show edit update destroy ]

  def index
    @departments = Department.order(sort_column + ' ' + sort_direction)
  end

  def show
    @department = Department.find(params[:id])
    @investigations = Investigation.where({'department_id' => @department.id})
    @num_cases = @investigations.count
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
        redirect_to "/departments"
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
    redirect_to departments_url, notice: "Department was successfully destroyed." 
  end

  private
    def sort_column
      Department.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:name, :address, :jurisdiction, :active_cases, :is_federal)
    end
end
