ActiveAdmin.register_page "Intereses" do

  menu :parent => "Estadisticas"

  content do
    render partial: "interest_statistics"
  end

  controller do
    def index
      @interest_client = Hash.new
      @interest_offer = Hash.new
      all = Title.all
      all.each do |title|
        @interest_client[title.name] = title.num_clients
        @interest_offer[title.name] = title.num_offers
      end

    end
  end

end