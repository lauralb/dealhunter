ActiveAdmin.register_page "Ofertas" do
  menu :parent => "Estadisticas"

  content do
    render partial: "ofertas"
  end

  controller do
    def index
      # super
      @offers_published = Statistics.offers_per_month
      @client_offers = Statistics.clientes_offers_per_month
    end
  end
end