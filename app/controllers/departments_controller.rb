class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[ show edit update destroy ]

  def index
    @departments = Department.sort_created_descend
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
    @department = Department.find(params[:id])
      if @department.update(department_params)
        redirect_to departments_url
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @department.destroy
    redirect_to departments_url, notice: "Department was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:name, :address, :jurisdiction, :active_cases, :is_federal)
    end
end
