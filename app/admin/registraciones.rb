ActiveAdmin.register_page "Registraciones" do
  menu :parent => "Estadisticas"

  content do
    render partial: "registraciones"
  end

  controller do
    def index
      # super
      @comp_registrations = Statistics.company_registrations
      @client_registrations = Statistics.client_registrations
    end
  end
end