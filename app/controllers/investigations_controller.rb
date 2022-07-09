class InvestigationsController < ApplicationController
  before_action :set_investigation, only: %i[ show edit update destroy ]

  # GET /investigations or /investigations.json
  def index
    @investigations = Investigation.all
  end

  # GET /investigations/1 or /investigations/1.json
  def show
  end

  # GET /investigations/new
  def new
    @investigation = Investigation.new
    @department_names = Department.pluck(:name)
  end

  # GET /investigations/1/edit
  def edit
  end

  # POST /investigations or /investigations.json
  def create
    @investigation = Investigation.new(investigation_params)
      if @investigation.save
        redirect_to investigation_url(@investigation), notice: "Case was successfully created." 
        render :show, status: :created, location: @investigation 
      else
        render :new, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /investigations/1 or /investigations/1.json
  def update
      if @investigation.update(investigation_params)
        redirect_to investigation_url(@investigation)
      else
        render :edit, status: :unprocessable_entity 
      end
  end

  # DELETE /investigations/1 or /investigations/1.json
  def destroy
    @investigation.destroy

    respond_to do |format|
      format.html { redirect_to investigations_url, notice: "Case was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigation
      @investigation = Investigation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def investigation_params
      params.require(:investigation).permit(:subject, :uid, :active, :active_leads, :department_id)
    end
end
