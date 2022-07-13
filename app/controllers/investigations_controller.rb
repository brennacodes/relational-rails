class InvestigationsController < ApplicationController
  before_action :set_investigation, only: %i[ show edit update destroy ]

  def index
    @investigations = Investigation.show_true.order(sort_column + " " + sort_direction)
  end

  def show
    @investigation = Investigation.find(params[:id])
  end

  def new
  end
  
  def edit
    @investigation = Investigation.find(params[:id])
  end
  
  def create
    @investigation = Investigation.new(investigation_params)
    @department = Department.find(@investigation.department_id)
    @investigation = @department.investigations.new(investigation_params)
    redirect_to department_cases_path(@department)
  end

  def update
    @investigation = Investigation.find(params[:id])
    @investigation.update(investigation_params)
    redirect_to investigation_path(@investigation)
  end

  def destroy
    @investigation = Investigation.find(params[:id])
    @investigation.destroy
    redirect_to investigations_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigation
      @investigation = Investigation.find(params[:id])
    end

    def investigation_params
      params.require(:investigation).permit(:subject, :uid, :active, :active_leads, :department_id)
    end
end
