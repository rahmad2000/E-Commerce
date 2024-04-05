ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :price, :stock_quantity, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :stock_quantity, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # app/admin/products.rb

  permit_params :name, :description, :price, :stock_quantity, :category_id, :image

  filter :name
  filter :price
  filter :stock_quantity
  filter :category, as: :select, collection: -> { Category.all }
  filter :created_at

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :category, as: :select, collection: Category.all.map { |c| [c.name, c.id] }, include_blank: false
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :stock_quantity
      row :category
      row :image do |product|
        image_tag url_for(product.image) if product.image.attached?
        if product.image.attached?
          image_tag product.image.variant(resize_to_limit: [300, 300]).processed
        else
          text 'No Image'
        end
      end
    end
    active_admin_comments
  end

end
