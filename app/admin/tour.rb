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
      row :rating
      row :title
      row :published do
        if tour.published == true
          status_tag("Yes", :ok)
        else
          status_tag("No", :error)
        end
      end
      row :type_of_tours do
        raw tour.rest_types.map { |x| link_to x.title, admin_type_of_tour_path(x.id) }.join(', ')
      end
      row :countries do
        raw tour.countries.map { |x| link_to x.title, admin_country_path(x.id) }.join(', ')
      end
      if tour.managers.present?
        row :managers do
          raw tour.managers.map { |x| link_to x.name, admin_manager_path(x.id) }.join(', ')
        end
      end
      if tour.visas.present?
        row :visas do
          raw tour.countries.map { |x| link_to x.title, admin_visa_path(x.id) }.join(', ')
        end
      end
      row :description do
        raw tour.description
      end
      row :checkpoints do
        ul do
          tour.checkpoints.each do |ch|
            li do
              ch.title
            end
          end
        end
      end

      if tour.images.present?
        row "Gallery" do
          ul style: 'list-style-type: none;' do
            tour.images.each do |img|
              li do
                image_tag(img.image.url(:thumb))
              end
            end
          end
        end
      end
      if tour.attaches.present?
        row "Documents" do
          ul style: 'list-style-type: none;' do
            tour.attaches.each do |doc|
              li do
                link_to "#{doc.title}", "#{doc.document.url}"
              end
            end
          end
        end
      end
      row :created_at do
        tour.created_at.strftime("%e %B %Y")
      end
    end
    panel "Dates and price" do
      attributes_table_for tour.date_prices do
        tour.date_prices.each do |f|
          row "#{f.day_of}" do
            ul style: 'list-style-type: none;'  do
              li do
                "Deadline date: #{f.deadline_date}"
              end
              li do
                "Price: #{f.price}#{f.currency}"
              end
            end
          end
        end
      end
    end
    panel "Steps" do
      attributes_table_for tour.steps do
        tour.steps.each do |f|
          row "#{f.number}" do
            raw f.description
          end
        end
      end
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :rating
      f.input :short_title
      f.input :title
      f.input :published, as: :boolean
      f.input :countries, as: :check_boxes
      f.input :rest_types, as: :check_boxes
      f.input :visas, as: :check_boxes
      f.input :managers, as: :check_boxes
      f.input :description
      f.has_many :checkpoints do |x|
        x.input :_destroy, as: :boolean, required: false, label: 'Remove' if x.object.id.present?
        x.input :title
      end
      f.has_many :steps do |x|
        x.input :_destroy, as: :boolean if x.object.id.present?
        x.input :number
        x.input :description
      end
      f.has_many :date_prices do |x|
        x.input :day_of
        x.input :deadline_date
        x.input :price
        x.input :special, as: :boolean
        x.input :currency, collection: [['dollar', '$'], ['euro', '€']]
      end
      f.has_many :images do |x|
        x.input :_destroy, as: :boolean, required: false, label: 'Remove' if x.object.id.present?
        x.input :title
        x.input :image, as: :file, hint: f.template.image_tag(x.object.image.url(:thumb)), input_html: {value: x.object.image.url(:thumb)}
      end
      f.has_many :attaches do |x|
        x.input :_destroy, as: :boolean, required: false, label: 'Remove' if x.object.id.present?
        x.input :title
        x.input :document, as: :file, hint: f.template.link_to(x.object.document.url), input_html: {value: x.object.document.url}
      end
      f.buttons
    end
  end

  controller do
    def permitted_params
      params.permit tour: [:short_title, :title, :description, :rating, :published, :country_ids => [], :manager_ids => [], :visa_ids => [],
                           :rest_type_ids => [], images_attributes: [:id, :title, :image, :_destroy],
                           checkpoints_attributes: [:id, :title, :_destroy], attaches_attributes: [:id, :title, :document, :_destroy],
                           steps_attributes: [:id, :number, :description, :_destroy],
                           date_prices_attributes: [:id, :day_of, :special, :deadline_date, :price, :currency]]
    end
  end

end
