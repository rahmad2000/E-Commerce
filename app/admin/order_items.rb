ActiveAdmin.register OrderItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :order_id, :product_id, :quantity, :price, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:order_id, :product_id, :quantity, :price, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # app/admin/order_items.rb
  permit_params :order_id, :product_id, :quantity, :price, :status

  form do |f|
    f.inputs 'OrderItem Details' do
      f.input :order_id, as: :select, collection: Order.all.map { |o| [o.id, o.id] }
      f.input :product_id, as: :select, collection: Product.all.map { |p| [p.name, p.id] }
      f.input :quantity
      f.input :price
      f.input :status
    end
    f.actions
  end

  show do
    attributes_table do
      row :order
      row :product
      row :quantity
      row :price
      row :status
    end
    active_admin_comments
  end

end
