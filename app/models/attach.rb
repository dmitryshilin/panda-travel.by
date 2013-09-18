class Attach < ActiveRecord::Base
  belongs_to :tour
  has_attached_file :document
  validates_attachment_content_type :document, content_type: ['application/zip', 'application/x-zip', 'application/x-zip-compressed', 'application/pdf', 'application/x-pdf', 'text/plain', 'application/msword', 'application/zip'], message: 'Only ZIP, PDF, WORD or TEXT files are allowed.'
  #validates_attachment_size :uploaded_file, :less_than => 20.megabytes
  validates_presence_of :title
  validates_length_of :title, within: 5..100
  before_validation on: :create do
    if document_content_type == 'application/octet-stream'
      mime_type = MIME::Types.type_for(document_file_name)
      self.document_content_type = mime_type.first if mime_type.first
    end
  end

end
