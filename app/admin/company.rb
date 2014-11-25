ActiveAdmin.register Company do


  index do
    column :id
    column :email
    column :name
    column :cuit
    default_actions
  end

  filter :email
  filter :name
  filter :cuit

  form :partial => "form"

  show do |f|
    attributes_table do
      row :id
      row :email
      row :name
      row :cuit
    end
    panel "Sucursales" do
      table_for(company.branches) do |t|
        t.column("Nombre"){ |item| item.name}
        t.column("Direccion"){|item| item.address_as_string}
      end
    end
  end

  controller do
    def create
      super

      @user = Koala::Facebook::API.new('CAAV42X5Tty0BAGZA0kIdBxqero47da1ZAJ9fZB3FH59WUg7ZCW1ORb0Tk46eQTkUF8nyvb51z2LznIeRDCRBM9jCTRheZAd4wBHuxcE4vSucIZBt2MzQEiopPKt3AzNmRN2o4S54LTvkumBjWLHZA8cIMkKwlUENb6Vd4cBnmiOmi1GXhJd1ZAEqWOZALxBlvzNwZD')
      dealhunter = @user.get_connections('me', 'accounts')[1]
      page_id = dealhunter['id'] #this gets the dealhunters page id.
      page_access_token = dealhunter['access_token'] #this gets the dealhunters page token.
      @page = Koala::Facebook::API.new(page_access_token)

      unless @company.user.nil?
        role_id = UserRole.where(:name => "CompanyUser").first().id
        @company.user.user_role_id = role_id
        @company.save!
        NewUserMailer.new_user_email(@company.user, @company).deliver
        @page.put_object(page_id, 'feed', :message => @company.name + " se ha unido")
      end
    end

    def update
      super
      unless @company.user.nil?
        role_id = UserRole.where(:name => "CompanyUser").first().id
        @company.user.user_role_id = role_id
        @company.save!
      end
    end

  end

end