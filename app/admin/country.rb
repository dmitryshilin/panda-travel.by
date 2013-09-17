ActiveAdmin.register Country do

  index do
    column :rating
    column :title, sortable: 'title' do |country|
      link_to country.title, admin_country_path(country)
    end

    #column :flag do |country|
    #  if country.flag.count != 0
    #    image_tag(country.flag.url(:small))
    #  end
    #end
    column :number_of_tours do |country|
      country.tours.count
    end
    default_actions
  end

  show title: "Country" do |country|
    attributes_table do
      row :rating
      row :title
      #if country.flag.count != 0
      #  row :flag do
      #    image_tag(country.flag.url(:small))
      #  end
      #end
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
      f.input :title
      f.input :description
      #if f.object.flag.count != 0
      #  f.input :flag, hint: f.template.image_tag(f.object.flag.url(:small)), as: :file
      #else
      #  f.input :flag
      #end
      f.buttons
    end
  end

  controller do
    def permitted_params
      params.permit country: [:title, :description, :rating]
    end
  end

end