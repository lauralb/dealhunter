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
end                                   
