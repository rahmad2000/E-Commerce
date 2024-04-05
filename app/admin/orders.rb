ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :total_price, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :total_price, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # app/admin/orders.rb
  permit_params :user_id, :total_price, :status

  form do |f|
    f.inputs 'Order Details' do
      f.input :user_id, as: :select, collection: User.all.map { |u| [u.email, u.id] }
      f.input :total_price
      f.input :status
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :total_price
      row :status
    end
    active_admin_comments
  end

end
