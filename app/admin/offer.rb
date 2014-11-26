ActiveAdmin.register Offer do
  index do
    column :id
    column :name
    column :company
    column :start_date
    column :publication_date
    column :branch
    default_actions
  end

  filter :id
  filter :name
  filter :company
  filter :branch

  form :partial => "form"


  show do |f|
    attributes_table do
      row :id
      row :name
      row :company
      row :branch
      row :publication_date
      row :start_date
      row :end_date
      row :photo
    end

    panel "Premios" do
      table_for(offer.prizes) do |t|
        t.column("Nombre"){ |item| item.name}
        t.column("Precio real"){|item| item.real_price}
        t.column("Porcentaje descuento"){|item| item.discount_percentage}
      end
    end

    panel "Inscriptos" do
      table_for(offer.clients) do |t|
        t.column("Mail"){ |item| item.user.email}
        t.column("Nombre"){|item| item.first_name}
        t.column("Apellido"){|item| item.last_name}
      end
    end

  end

  controller do
    def create
      if !params["offer"]["branch_id"].empty?
        super
        @offer.is_first_game = [true, false].sample
        @offer.save
      else
        redirect_to :back, :notice => "debe completar todos los campos obligatorios"
      end

      @user = Koala::Facebook::API.new('CAAV42X5Tty0BAGZA0kIdBxqero47da1ZAJ9fZB3FH59WUg7ZCW1ORb0Tk46eQTkUF8nyvb51z2LznIeRDCRBM9jCTRheZAd4wBHuxcE4vSucIZBt2MzQEiopPKt3AzNmRN2o4S54LTvkumBjWLHZA8cIMkKwlUENb6Vd4cBnmiOmi1GXhJd1ZAEqWOZALxBlvzNwZD')
      dealhunter = @user.get_connections('me', 'accounts')[1]
      page_id = dealhunter['id'] #this gets the dealhunters page id.
      page_access_token = dealhunter['access_token'] #this gets the dealhunters page token.
      @page = Koala::Facebook::API.new(page_access_token)

      Offer.all.each do |offer|
        if offer.start_date <= DateTime.now && !offer.publicated
          t = offer.name
          b = offer.description.first(50)+"..."  unless offer.description.nil?
          options = {
              :message     => "#{t}",
              :description => "#{b}",
              :link        => "http://localhost:3000/offers/#{(offer.id).to_s}"
              #          :picture     => # "http://localhost:3000"+"#{offer.photo_url}"
          }
          @page.put_object(page_id, 'feed', options)
          offer.publicated = true
          offer.save!
        end
      end

    end
  end

end