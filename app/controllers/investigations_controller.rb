class InvestigationsController < ApplicationController
  before_action :set_investigation, only: %i[ show edit update destroy ]
  helper_method :sort_column, :sort_direction

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
    redirect_to investigations_url
  end

  def destroy
    @investigation = Investigation.find(params[:id])
    @investigation.destroy
    redirect_to investigations_path
  end

  private
    def sort_column
      Investigation.column_names.include?(params[:sort]) ? params[:sort] : "subject"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_investigation
      @investigation = Investigation.find(params[:id])
    end

    def investigation_params
      params.require(:investigation).permit(:subject, :uid, :active, :active_leads, :department_id)
    end
end
