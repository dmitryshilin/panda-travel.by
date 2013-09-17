ActiveAdmin.register Tour do

  scope :all, default: true
  scope :published do |tour|
    tour.where(published: true)
  end
  scope :unpublished do |tour|
    tour.where(published: false)
  end

  index do
    column :published do |tour|
      if tour.published == true
        status_tag("Yes", :ok)
      else
        status_tag("No", :error)
      end
    end
    column :title do |tour|
      link_to tour.title, admin_tour_path(tour)
    end
    column :countries do |tour|
      raw tour.countries.map { |x| link_to x.title, admin_country_path(x.id) }.join(', ')
    end
    default_actions
  end

  show title: "Tour" do |tour|
    attributes_table do
      row :title
      row :published do
        if tour.published == true
          status_tag("Yes", :ok)
        else
          status_tag("No", :error)
        end
      end
      row :type_of_tours do
        raw tour.rest_types.map { |x| link_to x.title, admin_type_of_tour_path(x.slug) }.join(', ')
      end
      row :countries do
        raw tour.countries.map { |x| link_to x.title, admin_country_path(x.slug) }.join(', ')
      end
      if tour.managers.present?
        row :manager do
          raw tour.managers.map { |x| link_to x.name, admin_manager_path(x.id) }.join(', ')
        end
      end
      row :description do
        raw tour.description
      end

      if tour.images.present?
        row "Gallery" do
          ul do
            tour.images.each do |img|
              li do
                image_tag(img.image.url(:medium))
              end
            end
          end
        end
      end
      row :created_at do
        tour.created_at.strftime("%e %B %Y")
      end
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :rating
      f.input :title
      f.input :published, as: :boolean
      f.input :countries, as: :check_boxes
      f.input :rest_types, as: :check_boxes
      f.input :managers, as: :check_boxes
      f.input :description
      f.has_many :images do |x|
        x.input :_destroy, as: :boolean, required: false, label: 'Remove' if x.object.id.present?
        x.input :title
        x.input :image, as: :file, hint: f.template.image_tag(x.object.image.url(:medium)), input_html: {value: x.object.image.url(:medium)}
      end
      f.buttons
    end
  end

  controller do
    def permitted_params
      params.permit tour: [:title, :description, :rating, :published, :country_ids => [], :manager_ids => [],
                           :rest_type_ids => [], images_attributes: [:id, :title, :image, :_destroy]]
    end
  end

end
