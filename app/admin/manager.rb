ActiveAdmin.register Manager do
  index do
    column :name do |manager|
      link_to manager.name, admin_manager_path(manager)
    end
    column :number_of_tours do |manager|
      manager.tours.count
    end
    default_actions
  end

  show title: "Manager" do |manager|
    attributes_table do
      row :name
      row :number_of_tours do
        manager.tours.count
      end
      row :created_at do
        manager.created_at.strftime("%e %B %Y")
      end
    end
    panel "Manager contacts" do
      attributes_table_for manager.contacts do
        manager.contacts.each do |f|
          row "#{f.contact_type}" do
            f.description
          end
        end
      end
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :name
      f.has_many :contacts do |x|
        x.input :_destroy, as: :boolean, required: false, label: 'Remove' if x.object.id.present?
        x.input :contact_type
        x.input :description
      end
      f.buttons
    end
  end

  controller do
    def permitted_params
      params.permit manager: [:name, contacts_attributes: [:id, :contact_type, :description, :_destroy]]
    end
  end

end
