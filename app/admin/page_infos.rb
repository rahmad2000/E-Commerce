ActiveAdmin.register PageInfo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :page_type, :title, :content
  #
  # or
  #
  # permit_params do
  #   permitted = [:page_type, :title, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :page_type, :title, :content

  form do |f|
    f.inputs do
      f.input :page_type, as: :select, collection: ['about', 'contact'], include_blank: false
      f.input :title
      f.input :content, as: :text
    end
    f.actions
  end

end
