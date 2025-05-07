# app/controllers/dashboard/prospects_controller.rb
module Dashboard
  class ProspectsController < DashboardBaseController
    def index
      @query = params[:query]
      @per_page = params[:per_page] || 25

      @prospects = Prospect.all
      @prospects = @prospects.where("name LIKE :q OR email LIKE :q", q: "%#{@query}%") if @query.present?
      @prospects = @prospects.page(params[:page]).per(@per_page)
    end

    def new
      @prospect = Prospect.new
    end

    def create
      @prospect = Prospect.new(prospect_params)
      if @prospect.save
        redirect_to dashboard_prospects_path, notice: "Prospect created successfully."
      else
        render :new
      end
    end

    private
    def prospect_params
      params.require(:prospect).permit(:name, :email, :phone_number)
    end
  end
end
