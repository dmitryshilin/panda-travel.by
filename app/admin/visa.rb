ActiveAdmin.register Visa do
  index do
    column :title do |visa|
      link_to visa.title, admin_visa_path(visa)
    end
    column :created_at do |visa|
      visa.created_at.strftime("%e %B %Y")
    end
    default_actions
  end

  show title: "Visas" do |visa|
    attributes_table do
      row :title
      row :description do
        raw visa.description
      end
      row :created_at do
        visa.created_at.strftime("%e %B %Y")
      end
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.buttons
    end
  end

  controller do
    def permitted_params
      params.permit visa: [:title, :description]
    end
  end

end
