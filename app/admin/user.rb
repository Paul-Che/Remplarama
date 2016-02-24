ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#

  permit_params :first_name, :last_name, :has_practice, :avatar, :presentation, :education, :publications, :admin

#  or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

#  Customize the view of your table in admin !
  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :email
    column :has_practice
    column :avatar
    column :presentation
    column :education
    column :publications
    column :admin
    actions
  end

# Customize your form when your edit or add user in admin :
  # form do |f|
  #  f.inputs "Identity" do
  #    f.input :first_name
  #    f.input :email
  #  end
  #  f.inputs "Admin" do
  #    f.input :admin
  #  end
  #  f.actions
  # end

end
