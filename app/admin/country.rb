ActiveAdmin.register Country do

  index do
    column :rating
    column :region, sortable: 'region'
    column :title, sortable: 'title' do |country|
      link_to country.title, admin_country_path(country)
    end
    column :flag do |country|
      if country.flag.present?
        image_tag(country.flag.url(:original))
      end
    end
    column :number_of_tours do |country|
      country.tours.count
    end
    default_actions
  end

  show title: "Country" do |country|
    attributes_table do
      row :rating
      row :region
      row :title
      if country.flag.present?
        row :flag do
          image_tag(country.flag.url(:original))
        end
      end
      row :description do
        raw country.description
      end
      row :created_at do
        country.created_at.strftime("%e %B %Y")
      end
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :region, collection: ['Европа','Азия','Африка','Южная Америка','А также']
      f.input :title
      f.input :description
      if f.object.flag.present?
        f.input :flag, hint: f.template.image_tag(f.object.flag.url(:original)), as: :file
        f.input :flag_delete, as: :boolean, label: 'Remove'
      else
        f.input :flag
      end
      f.buttons
    end
  end

  controller do
    def permitted_params
      params.permit country: [:slug,:title, :description, :rating, :region, :flag, :flag_delete]
    end
  end

end
