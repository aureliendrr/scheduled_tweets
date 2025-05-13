module Dashboard
  class InteractionsController < ApplicationController
    before_action :set_prospect

    def new
      @interaction = @prospect.interactions.build
    end

    def create
      @interaction = @prospect.interactions.build(interaction_params)
      if @interaction.save
        redirect_to dashboard_prospects_path(@prospect), notice: "Interaction added successfully."
      else
        Rails.logger.error(@interaction.errors.full_messages.to_sentence)
        redirect_to dashboard_prospects_path(@prospect), alert: "Failed to add interaction."
      end
    end

    private

    def set_prospect
      @prospect = Prospect.find(params[:prospect_id])
      unless @prospect
        redirect_to dashboard_prospects_path, alert: "Prospect not found."
      end
    end

    def interaction_params
      params.permit(:prospect_id, :kind, :content).merge(occurred_at: Time.current)
    end
  end
end
