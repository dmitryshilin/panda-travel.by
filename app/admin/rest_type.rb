ActiveAdmin.register RestType do

  index do
    column :title do |type|
      link_to type.title, admin_rest_type_path(type)
    end
    column :number_of_tours do |type|
      type.tours.count
    end
    default_actions
  end

  show title: "Type of tour" do |type|
    attributes_table do
      row :title
      row :created_at do
        type.created_at.strftime("%e %B %Y")
      end
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :title
      f.buttons
    end
  end

  controller do
    def permitted_params
      params.permit rest_type: [:title]
    end
  end

end
