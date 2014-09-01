ActiveAdmin.register Offer do
  index do
    column :id
    column :name
    column :company
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

end