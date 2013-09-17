ActiveAdmin.register News do
  scope :all, default: true
  scope :published do |news|
    news.where(published: true)
  end
  scope :unpublished do |news|
    news.where(published: false)
  end

  index do
    column :published do |news|
      if news.published == true
        status_tag("Yes", :ok)
      else
        status_tag("No", :error)
      end
    end
    column :short_title do |news|
      link_to news.title, admin_news_path(news)
    end
    column :created_at do |news|
      news.created_at.strftime("%e %B %Y")
    end
    default_actions
  end

  show title: "News" do |news|
    attributes_table do
      row :short_title
      row :title
      row :published do
        if news.published == true
          status_tag("Yes", :ok)
        else
          status_tag("No", :error)
        end
      end
      row :content do
        raw news.content
      end
      row :created_at do
        news.created_at.strftime("%e %B %Y")
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
      params.permit news: [:short_title, :title, :content, :published]
    end
  end

end
