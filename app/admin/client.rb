ActiveAdmin.register Client do
  index do
    column :id
    column :email
    column :first_name
    column :last_name
    default_actions
  end

  filter :id
  filter :user_email,:as => :string, :label =>"Email"
  filter :first_name
  filter :last_name

  form :partial => "form"

  show do |f|
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row "Direccion" do
        f.address.full_address
      end
    end
  end

  controller do
    def create
      @user = User.new( params[:client][:user_attributes] )
      @user.user_role_id = 2
      if !@user.save
        redirect_to new_admin_client_path , notice: 'El cliente no ha podido crearse.'
      end

      @client = Client.new
      @client.first_name = params[:client][:first_name]
      @client.last_name =  params[:client][:last_name]
      @client.user_id = @user.id
      @client.newsletter_frequency_id = 3
      @client.save!
      if !@client.save
        redirect_to new_admin_client_path, notice: 'El cliente no ha podido crearse.'
      end
      NewUserMailer.new_client_email(@client.user).deliver


      @address = Address.new( params[:client][:address_attributes] )
      @address.client_id = @client.id
      @address.save

      redirect_to admin_clients_path

    end
  end

end


