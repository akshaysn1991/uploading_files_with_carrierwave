class Attachment < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates_presence_of :attachment
	before_save :update_file_attributes

  private

  def update_file_attributes
    if attachment.present? && attachment_changed?
      self.content_type = attachment.file.content_type
      self.original_filename = attachment.file.original_filename
    end
  end
end
