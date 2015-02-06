class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

  def index
    # @opportunities = Opportunity.where(:active?).order(:est_close_at)
    @opportunities = Opportunity.all.order(:est_close_at)
  end

  def show
  end

  def new
    @opportunity = Opportunity.new
  end

  def edit
  end

  # POST /opportunities
  def create
    @opportunity = Opportunity.new(opportunity_params)

    if @opportunity.save
      redirect_to @opportunity, notice: 'Opportunity was successfully created.'
    else
      render :new
    end
  end

  def update
    if @opportunity.update(opportunity_params)
      redirect_to @opportunity, notice: 'Opportunity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @opportunity.destroy
    redirect_to opportunities_url, notice: 'Opportunity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def opportunity_params
      params.require(:opportunity).permit(:name, :organisation, :type_id, :identified_at, :source_id, :value, :weighting,
        :comments, :est_close_at, :stage_id, :idea_at, :lead_at, :initial_contact_at, :solution_development_at, :negotiation_at,
        :needs_analysis_at, :won_lost_at, :source_detail, :contact_name, :est_effort_days, :lost_reason_type_id, :lost_reason)
    end
end