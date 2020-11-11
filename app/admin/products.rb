ActiveAdmin.register Product do
  permit_params :upc, :price, :cost, :description, :on_hand, :name, :category_id, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
    f.actions
  end
end
