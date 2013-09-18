ActiveAdmin.register Article do

  scope :all, default: true
  scope :published do |article|
    article.where(published: true)
  end
  scope :unpublished do |article|
    article.where(published: false)
  end

  index do
    column :published do |article|
      if article.published == true
        status_tag("Yes", :ok)
      else
        status_tag("No", :error)
      end
    end
    column :title do |article|
      link_to article.title, admin_article_path(article)
    end
    default_actions
  end

  show title: "Article" do |article|
    attributes_table do
      row :published do
        if article.published == true
          status_tag("Yes", :ok)
        else
          status_tag("No", :error)
        end
      end
      row :short_title
      row :title
      row :content do
        raw article.content
      end
      row :created_at do
        article.created_at.strftime("%e %B %Y")
      end
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do
      f.input :short_title
      f.input :title
      f.input :published, as: :boolean
      f.input :content
      f.buttons
    end
  end

  controller do
    def permitted_params
      params.permit article: [:short_title, :title, :content, :published]
    end
  end
end
