ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :customer_id, :address_id, :order_date, :historic_pst_rate, :historic_gst_rate, :historic_hst_rate
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :address_id, :order_date, :historic_pst_rate, :historic_gst_rate, :historic_hst_rate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
