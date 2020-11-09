ActiveAdmin.register Customer do
  permit_params :name, :username, :email, :password

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :username
      f.input :email
      f.input :password, as: :string
    end
    f.actions
  end
end
