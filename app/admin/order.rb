ActiveAdmin.register Order do
  actions :all, :except => [:new, :create, :update]

  menu priority: 1

  index do
    column :name do |order|
      link_to order.name, admin_order_path(order)
    end
    column :phone
    column :email
    #column :tour do |order|
    #  link_to order.tour.title, admin_tour_path(order.tour.id)
    #end
    column :created_at do |order|
      order.created_at.strftime("%e %B %Y")
    end
    column "" do |resource|
      links = ''.html_safe
      links += link_to I18n.t('active_admin.view'), resource_path(resource),
                       :class => "member_link view_link"
      links += link_to I18n.t('active_admin.delete'), resource_path(resource),
                       :method => :delete,
                       :confirm => I18n.t('active_admin.delete_confirmation'),
                       :class => "member_link delete_link"
      links
    end
  end

  show do |order|
    attributes_table do
      row :name
      row :phone
      row :email
      row :notation
      #row :tour do
      #  order.tour.title
      #end
      row :created_at do
        order.created_at.strftime("%e %B %Y")
      end
    end
  end

end
