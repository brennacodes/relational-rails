class InvestigationsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_investigation, only: %i[ show edit update destroy ]

  def index
    @investigations = Investigation.show_true.order(sort_column + ' ' + sort_direction)
  end

  def show
  end


  def new
    @investigation = Investigation.new
  end
  
  def edit
    @investigation = Investigation.find(params[:id])
  end
  
  def create
    @investigation = Investigation.new(investigation_params)
    @department_names = Department.pluck(:name)
      if @investigation.save
        redirect_to investigation_url(@investigation)
      else
        render :new, status: :unprocessable_entity 
      end
  end

  def update
    @investigation = Investigation.find(params[:id])
      if @investigation.update(investigation_params)
        redirect_to investigation_url
      else
        render :edit, status: :unprocessable_entity 
      end
  end

  def destroy
    @investigation = Investigation.find(params[:id])
    @investigation.destroy
    redirect_to investigations_path, notice: "Case was successfully destroyed." 
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

    # Only allow a list of trusted parameters through.
    def investigation_params
      params.require(:investigation).permit(:subject, :uid, :active, :active_leads, :department_id)
    end
end
