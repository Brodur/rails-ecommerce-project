ActiveAdmin.register Address do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :province_id, :customer_id, :is_primary_address, :postal_code, :country_code, :city, :address_line_one, :address_line_two, :address_additional
  #
  # or
  #
  # permit_params do
  #   permitted = [:provinces_id, :customers_id, :is_primary_address, :postal_code, :country, :city, :address_line_one, :address_line_two, :address_additional]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
