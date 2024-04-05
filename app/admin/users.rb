ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :password_digest, :is_admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :password_digest, :is_admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # app/admin/users.rb
  permit_params :name, :email, :password, :password_confirmation, :is_admin

  form do |f|
    f.inputs 'User Details' do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :is_admin
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :is_admin
    end
    active_admin_comments
  end

end
